class Prototype < ActiveRecord::Base

  # Association
  belongs_to :user
  has_many :images
  has_many :comments
  has_many :likes

  acts_as_taggable

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['content'].blank? }

  #Default Paginatiton
  paginates_per 8


  def like_blank?(current_user)
    likes.find_by(user_id: current_user.id).blank?
  end
end

