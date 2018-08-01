bryan = Monster.create(name: "Bryan", hp: 10, ability: "aim")
amirata = Monster.create(name: "Amirata", hp: 15, ability: "aim")
hanz = Monster.create(name: "Hanz", hp: 20, ability: "aim")
scarlett = Monster.create(name: "Scarlett", hp: 25, ability: "aim")
eric = Monster.create(name: "Eric,the most Evil and Ultimate and Supreme leader", hp: 30, ability: "aim")

mars = Battlefield.create(name: "Mars", monster: bryan)
jupiter = Battlefield.create(name: "Jupiter", monster: amirata)
saturn = Battlefield.create(name: "Saturn", monster: hanz)
venus = Battlefield.create(name: "Venus", monster: scarlett)
earth = Battlefield.create(name: "Earth", monster: eric)

# sb = SoldierBattlefield.create(soldier_id: 1, battlefield_id: 2)








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
