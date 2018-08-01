class Monster < ActiveRecord::Base
  has_many :battlefields
  has_many :soldiers_battlefields, through: :battlefields

  # def monster_attack
  #   monster_attack_arr = [1, 2]
  #   monster_sample = monster_attack_arr.sample
  #   if monster_sample == 1
  #     puts "#{SoldierBattlefield.all.fourth.battlefield.monster.name}
  #     attacks! You lose #{SoldierBattlefield.all.fourth.soldier.hp} HP!"
  #   elsif monster_sample == 2
  #     puts "Missed!"
  #   end
  # end

  def attack(soldier)
    soldier.hp -= ([1, 2].sample)
  end

end
