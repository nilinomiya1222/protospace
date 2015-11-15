class Like < ActiveRecord::Base
  #Association
  belongs_to :prototype
  belongs_to :user
end
