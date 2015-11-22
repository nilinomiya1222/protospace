class Prototype < ActiveRecord::Base

  # Association
  belongs_to :user
  has_many :images
  has_many :comments
  has_many :likes

  acts_as_taggable

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }

  #Default Paginatiton
  paginates_per 8

  def create_images(image_params)
    image_params.each do |key, value|
      key == "main" ? images.create(image: value, status: "main") : images.create(image: value, status: "sub")
    end
  end

  def update_images(image_params)
    i = 0
    image_params.each do |key, value|
      key != "0" ? images[i].update(image: value[:sub], status: "sub") : images[0].update(image: value[:main], status: "main")
      i += 1
    end
  end

  def like_blank?(current_user)
    likes.find_by(user_id: current_user.id).blank?
  end
end
