class Monster < ActiveRecord::Base
  has_many :battlefields
  has_many :soldiers_battlefields, through: :battlefields
end
