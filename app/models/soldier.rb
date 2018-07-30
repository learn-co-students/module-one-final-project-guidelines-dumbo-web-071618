class Soldier < ActiveRecord::Base



  has_many :battlefields
  has_many :enemies, through: :battlefields


after_initialize :init

def init
  self.hp = 10
end
end
