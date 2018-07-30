class Resource <ActiveRecord::Base
  has_many :friends_with_resources
  has_many :friends, through: :friends_with_resources
end
