class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.includes(:user).order(likes_count: :DESC).page(params[:page])
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = current_user.prototypes.create(prototype_params)
    @prototype.save ? (redirect_to :root, success: 'プロトタイプが投稿されました') : (render :new, error: '投稿に失敗しました')
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.destroy
      redirect_to :root, success: 'プロトタイプの削除に成功しました'
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.user_id == current_user.id
      @prototype.update(prototype_params)
    end
    redirect_to :root, flash: {success: 'プロトタイプの編集に成功しました'}
  end

  def newest
    @prototypes = Prototype.includes(:user).order(created_at: :DESC).page(params[:page])
  end

  def popular
    @prototypes = Prototype.includes(:user).order(likes_count: :DESC).page(params[:page])
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :copy, :concept, images_attributes:[:id,:content, :status]).merge(tag_list: params[:prototype][:tag])
  end
end
