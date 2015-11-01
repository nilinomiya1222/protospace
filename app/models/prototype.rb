class Prototype < ActiveRecord::Base

  # Association
  belongs_to :user
  has_many :images
end
