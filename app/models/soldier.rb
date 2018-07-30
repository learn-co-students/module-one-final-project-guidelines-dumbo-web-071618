class Soldier < ActiveRecord::Base
  has_many :battlefields
  has_many :enemies, through: :battlefields
end
