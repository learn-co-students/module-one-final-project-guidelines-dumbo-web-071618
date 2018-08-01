require_relative '../config/environment'
# kevin = Soldier.first


puts "Welcome Soldier, what is your name?"

current_battlefield = SoldierBattlefield.new
current_battlefield.soldier = Player.find_or_create_by(user_input)
current_battlefield.monster = Battlefield.find_by(name: 'Mars').monster

current_battlefield.start_game

name = gets.chomp

soldier_exist(name)

# puts `clear`
menu_responsiblities(menu)

# monster_menu
