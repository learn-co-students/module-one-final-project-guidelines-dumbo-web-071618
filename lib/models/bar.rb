
class Bar < ActiveRecord::Base
  has_many :user
  # has_many :users, through: :bar_lists


end
