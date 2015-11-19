class LikesController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    current_user.likes.create(prototype_id: params[:prototype_id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, prototype_id: params[:id]).destroy
    @prototype = Prototype.find(params[:prototype_id])
  end
end
