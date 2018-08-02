require 'catpix'

def welcome

  puts "Halt..."
  sleep 1
  puts "Who goes there??"
end

def main_menu
  prompt = TTY::Prompt.new
  choice = prompt.select("Choose your destiny?") do |menu|
    menu.choice 'Choose your Battlefield'
    menu.choice 'Get new Weapons'
    menu.choice 'Exit'
  end
  choice
end
