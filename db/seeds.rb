privater = Monster.create(name: "Privater", hp: 10, ability: "aim")
corporal = Monster.create(name: "Corporal", hp: 15, ability: "aim")
sergeant = Monster.create(name: "Sergeant", hp: 20, ability: "aim")
captain = Monster.create(name: "Captain", hp: 25, ability: "aim")
eric = Monster.create(name: "Eric,the most Evil and Ultimate and Supreme leader", hp: 30, ability: "aim")

mars = Battlefield.create(name: "Mars", monster: privater)
jupiter = Battlefield.create(name: "Jupiter", monster: corporal)
saturn = Battlefield.create(name: "Saturn", monster: sergeant)
venus = Battlefield.create(name: "Venus", monster: captain)
earth = Battlefield.create(name: "Earth", monster: eric)

sb = SoldierBattlefield.create(soldier_id: 1, battlefield_id: 2)








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
