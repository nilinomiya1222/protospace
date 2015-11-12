class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(create_params[:prototype_id])
    @prototype.comments.create(text: create_params[:text], prototype_id: create_params[:prototype_id], user_id: current_user.id )
    redirect_to :root
  end

  private
  def create_params
    params.require(:comment).permit(:text, :prototype_id)
  end
end
