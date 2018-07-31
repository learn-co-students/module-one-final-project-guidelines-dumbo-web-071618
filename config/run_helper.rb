def welcome_to_music_box
  font = TTY::Font.new(:doom)
  welcome = Pastel.new
  to = Pastel.new
  music_box = Pastel.new
  puts welcome.green(font.write("Welcome"))
  puts to.yellow(font.write("to"))
  puts music_box.magenta(font.write("Music Box"))
end

def are_you_new_user?
  prompt = TTY::Prompt.new
  user_input = prompt.select("What's your status?",
    %w(New_User Current_User))

  if user_input == "New_User"
    puts "Please create username:"
    name = gets.chomp
    puts "New user created! Welcome, #{name}!"
  elsif user_input == "Current_User"
    puts "Please enter username:"
    name = gets.chomp
    puts "Welcome back, #{name}!"
  end
end
