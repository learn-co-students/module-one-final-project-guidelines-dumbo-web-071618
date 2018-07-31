monster_1 = Monster.create(name: "Private", hp: 10, ability: "aim")
monster_2 = Monster.create(name: "Corporal", hp: 15, ability: "aim")
monster_3 = Monster.create(name: "Sergeant", hp: 20, ability: "aim")
monster_4 = Monster.create(name: "Captain", hp: 25, ability: "aim")
monster_5 = Monster.create(name: "Eric,the most Evil and Ultimate and Supreme leader", hp: 30, ability: "aim")

mars = Battlefield.create(name: "Mars", monster: monster_1)





# monsters = [
#   {name: "Private", hp: 10, ability: "aim"},
#   {name: "Corporal", hp: 10, ability: "aim"},
#   {name: "Sergeant", hp: 10, ability: "aim"}
# ]
#
# ['Mars', 'Saturn', 'Jupiter'].each_with_index do |battlefield, idx|
#   creating_battlefield = Battlefield.find_or_create_by(name: battlefield)
#   creating_battlefield.monster.find_or_create_by(monsters[idx])
# end
