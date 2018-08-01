class SoldierBattlefield < ActiveRecord::Base
  belongs_to :soldier
  belongs_to :battlefield
  has_one :monster, through: :battlefield

  # this methods sets up battle
  def self.initialize_battle(soldier_data, monster_data)
    game = SoldierBattlefield.new
    game.monster = monster_data
    game.soldier = soldier_data
    game.save
    game
  end

  def menu
    prompt = TTY::Prompt.new
    choice = prompt.select("Choose your destiny?") do |menu|
      menu.choice 'Choose your Battlefield'
      menu.choice 'Get new Weapons'
      menu.choice 'Exit'
    end
    choice
  end
  # ************ game loop ********** #
  def game_loop
    while (!monster_dead? && !soldier_dead?)
      player_choice = monster_menu

      if player_choice == 'Run Away!'
        puts 'Coward! A soldier never turns his back!'
        return
      elsif player_choice == 'Check HP'
        puts "Your HP: #{soldier.hp}"
        next
      end
      player_turn
      monster_turn
    end
  end

  # this is the menu that user will interact with
  def monster_menu
    prompt = TTY::Prompt.new
    choice = prompt.select("Make your choice carefully") do |menu|
      menu.choice 'Attack'
      menu.choice 'Use Weapon'
      menu.choice 'Check HP'
      menu.choice 'Use Ability'
      menu.choice 'Run Away!'
    end
    choice
  end

  def player_turn
    puts "Player, what action will you choose?"
    # input
    soldier.attack(monster)
    puts "Monster HP: #{monster.hp}"
  end

  def monster_turn
    puts "Monster is attacking you!"
    self.monster.attack(self.soldier)
    puts " another message..."
  end

  def find_monster
    monster_found = Battlefield.all.select do |battlefields|
      battlefields.monster_id == self.soldier_id
    end
    monster_found
  end

  def monster_dead?
    monster.hp <= 0
  end

  def soldier_dead?
    soldier.hp <= 0
  end

end
