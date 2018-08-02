require_relative '../config/environment'

system "clear"
font = TTY::Font.new(:doom)
pastel = Pastel.new
puts pastel.yellow(font.write("LEARN.co"))
puts "Presents An Original..."
# Locate user by name, if not found, create user
sleep 2
puts pastel.cyan.on_bright_black(font.write("Learn"))
puts pastel.cyan.on_bright_black(font.write("Monster"))
sleep 1
welcome
user_name = gets.chomp
system "clear"
soldier_data = Soldier.setup_user(user_name)
## -------------

# Setup battlefield and monster
# monster_data = Battlefield.first.monster
monster_data = Battlefield.all.where.not(:name => nil).sample.monster
level_1 = SoldierBattlefield.initialize_battle(
  soldier_data, monster_data)
## --------------
# binding.pry

## Initiate Main Game Loop



  ## get user action from main menu
player_choice = main_menu

  ## handle action based on user choice
if player_choice == 'Choose your Battlefield'
  level_1.game_loop
elsif player_choice == 'Get new Weapons'
  puts "Bummer you got no weapons!... Yet"
elsif player_choice == 'Who have you Slayed?'
  soldier_data.monsters.each do |monster|
    puts monster.name
  end
elsif player_choice == 'Exit'
  puts "Come back when you grow up ... CHILD"
end

## -----------
# levels = Battlefield.all
#   find_monster = levels.select do |level|
#     level.monster_id == soldier_data.level
#   end
#
#   monster_data = find_monster[0].monster
