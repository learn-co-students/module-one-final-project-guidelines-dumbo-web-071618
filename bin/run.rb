require_relative '../config/environment'

system "clear"
font = TTY::Font.new(:doom)
pastel = Pastel.new
puts pastel.yellow(font.write("LEARN.co"))
puts "Presents An Original..."
# Locate user by name, if not found, create user
sleep 2
puts pastel.cyan.on_bright_black(font.write("Command-Line"))
puts pastel.cyan.on_bright_black(font.write("Commando"))
sleep 1
welcome
user_name = gets.chomp
system "clear"
soldier_data = Soldier.setup_user(user_name)
## -------------


## --------------
# binding.pry

## Initiate Main Game Loop


def method_name(soldier_data)
  ## get user action from main menu
  player_choice = main_menu
  ## handle action based on user choice
  # while player_choice == main_menu

    if player_choice == 'Choose your Battlefield'
      # Setup battlefield and monster
      # monster_data = Battlefield.first.monster
       puts "GET BACK ON YOUR FEET, SOLDIER (YOU GAIN #{soldier_data.hp +=5} HP)" if soldier_data.dead?
      monster_data = Battlefield.all.where.not(:name => nil).sample.monster
      level_1 = SoldierBattlefield.initialize_battle(
        soldier_data, monster_data)

      level_1.game_loop
      method_name(soldier_data)
    elsif player_choice == 'Get new Weapons'
      puts "===== WEAPON DLC (Not included) $19.99 slack Kevin for details!========"
      method_name(soldier_data)

    elsif player_choice == 'Who have you Slayed?'
      rows = []
      table = ""
      soldier_data.monsters.each do |monster|
        rows << [monster.name, monster.hp]
        table = Terminal::Table.new :title => "Slaughtered", :headings => ['Monster', 'HP'], :rows => rows.uniq
      end
      puts table
      method_name(soldier_data)

    else player_choice == 'Exit'
      puts "Come back when you grow up ... CHILD"
      # break
    end
  # end

end
method_name(soldier_data)

## -----------
# levels = Battlefield.all
#   find_monster = levels.select do |level|
#     level.monster_id == soldier_data.level
#   end
#
#   monster_data = find_monster[0].monster
