class Image < ActiveRecord::Base
  #Association
  belongs_to :prototype

  mount_uploader :content, ImageUploader

  #Main,Subの区別
  enum status: %i(main sub)


end
