class Soldier < ActiveRecord::Base



  has_many :battlefields
  has_many :enemies, through: :battlefields

  after_initialize :init

  def arr_abilities
    ["shoot", "kiss", "kick", "love", "sleep"]
  end

  def init
    self.hp = 10
    self.ability = arr_abilities.sample
  end


end
