require_relative '../config/environment'
# kevin = Soldier.first

# Locate user by name, if not found, create user
puts "Welcome Soldier, what is your name?"
user_name = gets.chomp
soldier_data = Soldier.setup_user(user_name)
## -------------

# Setup battlefield and monster
monster_data = Battlefield.first.monster
level_1 = SoldierBattlefield.initialize_battle(
  soldier_data, monster_data
)
## --------------
# binding.pry
level_1.game_loop
