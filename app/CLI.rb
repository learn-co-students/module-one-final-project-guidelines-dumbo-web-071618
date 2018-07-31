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

def menu_responsiblities(choice)
  case choice
  when 'Choose your Battlefield'
    puts "You are now fighting in "
  when 'Get new Weapons'
    puts "Ohh snap no weapons"
  when 'Rest'
    puts "Are you really tired?"
  end
end
