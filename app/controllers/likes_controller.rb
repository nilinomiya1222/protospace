class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id)
    @like.destroy
  end
end
