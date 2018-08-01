require_relative '../config/environment'
# kevin = Soldier.first


puts "Welcome Soldier, what is your name?"

user_name = gets.chomp

soldier_battlefield_instance = SoldierBattlefield.new

soldier_battlefield_instance.soldier_exist(user_name)

soldier_battlefield_instance.monster_menu

soldier_battlefield_instance.game_loop
