require_relative '../config/environment'



puts "Welcome Soldier, what is your name?"

name = gets.chomp

soldier_exist(name)

menu_choice = menu

if menu_choice == "Choose your Battlefield"
  mars = Battlefield.find_by_battlefield_name("Mars")
  puts "Your are now fighting in #{mars.battlefield_name}"
end
