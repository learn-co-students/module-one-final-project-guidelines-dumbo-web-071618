class SoldierBattlefield < ActiveRecord::Base
  belongs_to :soldier
  belongs_to :battlefield
  has_one :monster, through: :battlefield

  # this methods sets up battle
  def self.initialize_battle(soldier_data, monster_data)
    soldier_data.battlefields << Battlefield.all.sample
    soldier_data.soldier_battlefields.last
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
      system "clear"
      if player_choice == 'Attack'
        arr_comments = ["Die monster!", "OHHHHH Shiit hes about to explode!", "This is our only chance!"]
        puts arr_comments.sample
        sleep 1
      elsif player_choice == 'Run Away!'
        puts 'Coward! A soldier never turns his back!'
        break;
      elsif player_choice == 'Check HP'
        puts "Your HP: #{soldier.hp}"
        next
      elsif player_choice == 'Patch your wounds'
        soldier.heal
        puts "You have healed"
      end
      player_turn
      monster_turn
      puts "#{soldier.name} HAS LOST" if soldier_dead?
    end
  end


  # this is the menu that user will interact with
  def monster_menu
    prompt = TTY::Prompt.new
    choice = prompt.select("Make your choice carefully you're fighting #{monster.name}") do |menu|
      menu.choice 'Attack'
      menu.choice 'Use Weapon'
      menu.choice 'Check HP'
      menu.choice 'Patch your wounds'
      menu.choice 'Run Away!'
    end
    choice
  end

  def player_turn
    puts "Player, what action will you choose?"
    # input
    soldier.attack(monster)
    puts "Monster HP: #{monster.hp}"
    if soldier_dead?
      puts "Soldier DOWN SOLDIER DOWN!!! #{monster.name} has TAKEN OVER!"
    end
  end

  # def next_level
  #   if monster_dead?
  #     soldier.level += 1
  #     soldier.save
  #   end
  # end

  def monster_turn
    if !monster_dead?
      puts "#{monster.name} is attacking you!"
      monster.attack(soldier)
      puts " AHHHHH!!!"
    else monster_dead?
      puts "#{monster.name} has lost! "
    end
  end

  def monster_dead?
    monster.hp <= 0
  end

  def soldier_dead?
    soldier.hp <= 0
  end

end
