require_relative '../config/environment'



puts "Welcome Soldier, what is your name?"

name = gets.chomp

soldier_exist(name)

puts `clear`
menu_responsiblities(menu)

# monster_menu
