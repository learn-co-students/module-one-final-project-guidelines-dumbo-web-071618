class SoldierBattlefield < ActiveRecord::Base
  belongs_to :soldier
  belongs_to :battlefield
  belongs_to :monster, through: :battlefield

  def game_loop
    while true
      player_turn
      monster_turn
    end

    advance_stage
  end

  def player_turn
    "Player, what action will you choose?"
    # input
    self.solder.attack(self.monster)
  end

  def monster_turn
    "Monster is attacking you!"
    self.monster.attack(self.soldier)
    " another message..."
  end

  def monster_attack
    monster_attack_arr = [1, 2]
    monster_sample = monster_attack_arr.sample
    if monster_sample == 1
      puts "#{SoldierBattlefield.all.fourth.battlefield.monster.name}
      attacks! You lose #{SoldierBattlefield.all.fourth.soldier.hp} HP!"
    elsif monster_sample == 2
      puts "Missed!"
    end
  end

  def soldier_attack
     attack = if monster_menu == "Attack"
      Battlefield.all.first.monster.hp -= 1
    end
    puts "attack successfull current hp is now #{attack}"
  end


  def game_begin

  end

end
