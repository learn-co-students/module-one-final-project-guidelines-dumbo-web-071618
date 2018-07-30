class Friend <ActiveRecord::Base
  has_many :friends_with_resources
  has_many :resources, through: :friends_with_resources
end
