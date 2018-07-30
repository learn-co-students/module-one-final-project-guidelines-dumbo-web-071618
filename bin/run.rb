require_relative '../config/environment'



puts "Welcome Soldier, what is your name?"

name = gets.chomp

soldier_1 = Soldier.create(name: name)

puts "Welcome #{name} your hp is #{soldier_1.hp}"
