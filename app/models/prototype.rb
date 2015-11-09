class Prototype < ActiveRecord::Base

  # Association
  belongs_to :user
  has_many :images

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }

  #Default Paginatiton
  paginates_per 8

  def create_images(image_params)
    image_params.each do |key, value|
      key == "main" ? images.create(image: value, status: "main") : images.create(image: value, status: "sub")
    end
  end

  def update_images(image_params)
    ids = 2
    image_params.each do |key, value|
      key == "sub" ? images.update(ids, image: value, status: "sub") : images[0].update(image: value, status: "main")
    end
  end

end
