class Comment < ActiveRecord::Base
  #Associtation
  belongs_to :user
  belongs_to :prototype
end
