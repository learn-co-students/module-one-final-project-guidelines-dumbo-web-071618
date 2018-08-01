class SoldierBattlefield < ActiveRecord::Base
  belongs_to :soldier
  belongs_to :battlefield




   def soldier_exist(user_input)
    if soldier_found = Soldier.find_by_name(user_input)

      puts "Welcome back #{soldier_found.name} your current hp is #{soldier_found.hp} and your current ability is #{soldier_found.ability}."
      puts "You last fought at #{soldier_found.battlefields.last.name}"
    else
      new_soldier = Soldier.create(name: user_input)
      saved_soldier = SoldierBattlefield.create(soldier_id: new_soldier.id, battlefield_id: 1)
      puts "Welcome #{user_input} your hp is #{new_soldier.hp} and your special ability is #{new_soldier.ability}"
    end
  end

  def monster_menu
    prompt = TTY::Prompt.new
    choice = prompt.select("Choose your destiny?") do |menu|
      menu.choice 'Choose your Battlefield'
      menu.choice 'Get new Weapons'
      menu.choice 'Exit'
    end
    choice
  end


def level_select
  if monster_menu == 'Choose your Battlefield'
  puts  Battfield.all.name
end
end





  def game_loop
    while true
      player_turn
      monster_turn
    end
  end

  # def player_turn
  #   "Player, what action will you choose?"
  #   # input
  #   self.solder.attack(self.monster)
  # end
  #
  # def monster_turn
  #   "Monster is attacking you!"
  #   self.monster.attack(self.soldier)
  #   " another message..."
  # end

  def monster_turn
    monster_attack_arr = [1, 2]
    monster_sample = monster_attack_arr.sample
    if monster_sample == 1
      puts "#{SoldierBattlefield.all..battlefield.monster.name}
      attacks! You lose #{SoldierBattlefield.all.fourth.soldier.hp} HP!"
    elsif monster_sample == 2
      puts "Missed!"
    end
  end

  def player_turn
     attack = if monster_menu == "Attack"
      Battlefield.all.first.monster.hp -= 1
    end
    puts "attack successfull current hp is now #{attack}"
  end

  def find_monster
    monster_found = Battlefield.all.select do |battlefields|
      battlefields.monster_id == self.soldier_id
    end
    monster_found
  end

  def game_begin

  end

end
