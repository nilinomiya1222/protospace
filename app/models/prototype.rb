class Prototype < ActiveRecord::Base

  # Association
  belongs_to :user
  has_many :images

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }

  #Default Paginatiton
  paginates_per 8

  def create_images(image_params)
    image_params.each do |key, value|
      key == "main" ? images.create(image: value, status: 0) : images.create(image: value, status: 1)
    end
  end

  def update_images(image_params)
    image_params.each do |key, value|
      images.each do |image|
        key == "main" ? image.update(image: value, status: 0) : image.update.sub(image: value, status: 1)
      end
    end
  end

end
