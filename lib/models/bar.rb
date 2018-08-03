
class Bar < ActiveRecord::Base
  #has_many :users, through: :favorite_bar
  #we should think about this, and only uncomment the above for the sake of function
  #i.e if we want to see what the most popular bars were.
  has_many :favorite_bars

end
