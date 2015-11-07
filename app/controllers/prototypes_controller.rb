class PrototypesController < ApplicationController

  before_action :move_to_index, except: [:index, :show]


  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC").page(params[:page])
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = Prototype.create(prototype_params)
    @prototype.create_images(image_params)
    if @prototype.save ? redirect_to :root, flash: {success: 'プロトタイプが投稿されました'} : render :new, flash: {error: '投稿に失敗しました'}
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.destroy
    end
    redirect_to :root, flash: {success: 'プロトタイプの削除に成功しました'}
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.user_id == current_user.id
      @prototype.update(prototype_params)
      @prototype.update_images(update_image_params)
    end
    redirect_to :root, flash: {success: 'プロトタイプの編集に成功しました'}
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :copy, :concept).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:prototype).require(:images_attributes).require("0")
  end

  def update_image_params
    params.require(:prototype).require(:images_attributes)
  end

  def move_to_index
    redirect_to :root unless user_signed_in?
  end



end
