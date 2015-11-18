class LikesController < ApplicationController
  def create
    current_user.likes.create(prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, prototype_id: params[:id])
    @like.destroy
  end
end
