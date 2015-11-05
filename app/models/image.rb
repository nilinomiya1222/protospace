class Image < ActiveRecord::Base
  #Association
  belongs_to :prototype

  mount_uploader :image, ImageUploader

  #Main,Subの区別
  enum status: %i(main sub)


end
