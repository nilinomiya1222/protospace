class Image < ActiveRecord::Base
  #Association
  belongs_to :prototype

  mount_uploader :image, ImageUploader
end
