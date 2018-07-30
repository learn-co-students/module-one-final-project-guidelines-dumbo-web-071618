class Monster < ActiveRecord::Base
  has_many :battlefields
  has_many :soldiers, through: :battlefields
end
