class PrototypesController < ApplicationController
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
    if @prototype.save ? redirect_to :root, flash: {success: 'プロトタイプが投稿されました'} : redirect_to render :new, flash: {error: '投稿に失敗しました'}
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :copy, :concept).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:prototype).require(:images_attributes).require("0")
  end



end
