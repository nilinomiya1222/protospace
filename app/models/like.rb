class Like < ActiveRecord::Base
  #Association
  belongs_to :prototype, counter_cache: :likes_count
  belongs_to :user
end
