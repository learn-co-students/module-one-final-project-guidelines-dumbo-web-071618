class FriendsWithResource <ActiveRecord::Base
  belongs_to :friend
  belongs_to :resource
end
