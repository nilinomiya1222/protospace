class Thumbnail < ActiveRecord::Base
#Association
  belongs_to :prototype

  mount_uploader :content, ThumbnailUploader

  #Main,Subの区別
  enum status: %i(main sub)
end
