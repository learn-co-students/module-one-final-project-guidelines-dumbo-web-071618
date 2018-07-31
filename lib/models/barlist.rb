
class FavBar < ActiveRecord::Base
  belongs_to :bar
  belongs_to :user
end
