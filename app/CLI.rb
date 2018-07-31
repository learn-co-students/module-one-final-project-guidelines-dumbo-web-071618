require 'catpix'

def soldier_exist(name)
  if soldier_found = Soldier.find_by_name(name)

    puts "Welcome back #{name} your current hp is #{soldier_found.hp} and your current ability is #{soldier_found.ability}"
  else
    soldier_1 = Soldier.create(name: name)
    puts "Welcome #{name} your hp is #{soldier_1.hp} and your special ability is #{soldier_1.ability}"
  end
end


def menu
  prompt = TTY::Prompt.new
  choice = prompt.select("Choose your destiny?") do |menu|
    menu.choice 'Choose your Battlefield'
    menu.choice 'Get new Weapons'
    menu.choice 'Exit'
  end
  choice
end

def monster_menu
  prompt = TTY::Prompt.new
  choice = prompt.select("Make your choice carefully") do |menu|
    menu.choice 'Attack'
    menu.choice 'Use Weapon'
    menu.choice 'Monster HP'
    menu.choice 'Use Ability'
  end
  choice
end

def menu_responsiblities(choice)
  case choice
  when 'Choose your Battlefield'
    puts "You are now fighting in #{fighting_level} against #{fighting_monster}"
    monster_menu
  when 'Get new Weapons'
    puts "Ohh snap no weapons"
  when 'Rest'
    puts "Are you really tired?"
  end
end

def fighting_level
  "#{Battlefield.all.first.name}"
end

def fighting_monster
  "#{Battlefield.all.first.monster.name}"
end

# def monster_menu
#   prompt = TTY::Prompt.new
#   choice = prompt.select("Make your choice carefully") do |menu|
#     menu.choice 'Attack'
#     menu.choice 'Use Weapon'
#     menu.choice 'Monster Hp'
#   end
#   choice
# end
