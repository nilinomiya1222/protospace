class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used(20)
  end

  def show
    @prototypes = Prototype.tagged_with(params[:tag_name]).page(params[:page])
    render 'prototypes/index'
  end
end
