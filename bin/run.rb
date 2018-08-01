require_relative '../config/environment'
# kevin = Soldier.first


puts "Welcome Soldier, what is your name?"

user_name = gets.chomp

solder_battlefield_instance = SoldierBattlefield.new

solder_battlefield_instance.soldier_exist(user_name)
