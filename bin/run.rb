require_relative '../config/environment'
# kevin = Soldier.first
system "clear"
font = TTY::Font.new(:doom)
pastel = Pastel.new
puts pastel.yellow(font.write("LEARN.co"))
puts "Presents An Original..."
# Locate user by name, if not found, create user
sleep 3
puts pastel.cyan.on_bright_black(font.write("Learn"))
puts pastel.cyan.on_bright_black(font.write("Monster"))
sleep 2
welcome
user_name = gets.chomp
system "clear"
soldier_data = Soldier.setup_user(user_name)
## -------------

# Setup battlefield and monster
monster_data = Battlefield.first.monster
level_1 = SoldierBattlefield.initialize_battle(
  soldier_data, monster_data
)
## --------------
# binding.pry
menu
level_1.game_loop
