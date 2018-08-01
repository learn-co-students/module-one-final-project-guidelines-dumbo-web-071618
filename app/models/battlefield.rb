class Battlefield < ActiveRecord::Base
  has_many :soldier_battlefields
  has_many :soldiers, through: :soldier_battlefields
  belongs_to :monster
end
#soldier.battlefield_id.monster 
