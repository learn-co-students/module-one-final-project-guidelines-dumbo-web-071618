
class Bar < ActiveRecord::Base
  has_many :users
  # has_many :users, through: :bar_lists


end
