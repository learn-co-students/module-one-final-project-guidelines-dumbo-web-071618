# this is where we write/put all the code currently sitting in user. It's also where we'd enhance our interface with tty:prompt.
#def welcome_graphic
font = TTY::Font.new("3d")
pastel = Pastel.new
puts pastel.green(font.write("welcome"))
puts pastel.cyan(font.write("to"))
#end

#class CLI
  prompt = TTY::Prompt.new

  user = User.create_user(prompt.ask('what is your name?'))
  user.ask_location
  variable = prompt.select("what do you want to do?", %w(find_bar add_bar remove_bar))

  if variable == "find_bar"
     user.find_bar
  elsif variable == "add_bar"
     user.add_bar
  elsif variable == "remove_bar"
    user.remove_bar
  end

  binding.pry

  puts "hello"


#end
