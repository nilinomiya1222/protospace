class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    Prototype.create(prototype_params)
    redirect_to controller: :prototypes, action: :index
  end

  private

  def prototype_params
    params.require(:prototype).permit(:name, :copy, :concept, images_attributes: [:image, :status, :prototype_id]).merge(user_id: current_user.id)
  end

end
