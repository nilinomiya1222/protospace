class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
  end

  def create
    Prototype.create(name: prototype_params[:name], copy: prototype_params[:copy], concept: prototype_params[:concept], user_id: current_user.id)
    redirect_to controller: :top, action: :index
  end

  private

  def prototype_params
    params.require(:prototype).permit(:name, :copy, :concept, :user_id)
  end

end
