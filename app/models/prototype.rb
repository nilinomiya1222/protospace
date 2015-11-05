class Prototype < ActiveRecord::Base

  # Association
  belongs_to :user
  has_many :images

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }

  #Default Paginatiton
  paginates_per 8

  def create_images(image_params)
    image_params.each do |key, value|
      if key == "main" ? images.create(image: value, status: 0) : images.create(image: value, status: 1)
    end
  end

end
