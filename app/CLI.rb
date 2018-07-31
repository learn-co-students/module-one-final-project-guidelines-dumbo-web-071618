require 'catpix'

def soldier_exist(name)
  if Soldier.find_by_name(name)
    puts "Welcome back #{name}"
  else
    soldier_1 = Soldier.create(name: name)
    puts "Welcome #{name} your hp is #{soldier_1.hp} and your special ability is #{soldier_1.ability}"
  end
end


def menu
  prompt = TTY::Prompt.new
  prompt.select("Choose your destiny?") do |menu|
    menu.choice 'Choose your Battlefield'
    menu.choice 'Get new Weapons'
    menu.choice 'Rest'
  end
end
