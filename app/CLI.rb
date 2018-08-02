require 'catpix'

def welcome

  puts "Welcome Soldier, what is your name?"
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
