# this is where we write/put all the code currently sitting in user. It's also where we'd enhance our interface with tty:prompt.
#class Cli

def welcome_graphic
font = TTY::Font.new("3d")
pastel = Pastel.new
puts pastel.green(font.write("bar"))
puts pastel.cyan(font.write("Tender"))
end


#--------------------------
def user_status
  prompt = TTY::Prompt.new
  variable = prompt.select("Welcome to Bar Tender! what would you like to do?", %w(Login Create_user))
    if variable == "Login"
      login
    elsif variable == "Create_user"
      create_user
    end
end
#--------------------------
def login
  puts "Please enter your username: "
  username = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
  if User.find_by(name: username)
    User.find_by(name: username)
  elsif username.downcase == "exit"
    puts "Returning to the main menu"
  else
    puts "Wrong login info. Please try again or type 'exit' to return to the main menu."
    login
  end
end
#--------------------------
def create_user
   puts "Please enter a new username: "
   username = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
  if User.find_by(name: username)
    puts "Username already taken."
    create_user
  else
    User.create(name: username)
  end
end
#--------------------------
def ask_location
  if !self.location
    puts "A location has not been specified. Please set your location"
    new_location = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
    self.update(location: new_location)
  else
    puts "Your current location is #{self.location}. Would you like to find a new location?"
    puts "Enter 1 to change your location or 2 to keep your saved location."
    input = gets.chomp.to_i
    case input
      when 1
        new_location = gets.chomp.split(" ").map{|w| w.capitalize}.join(" ")
        self.update(location: new_location)
        puts "Your new location is: #{self.location}."
      when 2
        puts "Location has not been changed"
      else
        "Invalid input"
        self.ask_location
    end
  end
end
#--------------------------
def options(user)
  prompt = TTY::Prompt.new
  variable = prompt.select("what do you want to do?", %w(find_bar add_bar remove_bar exit))
  if variable == "find_bar"
     user.find_bar
  elsif variable == "add_bar"
     user.add_bar
  elsif variable == "remove_bar"
    user.remove_bar
  elsif variable == "exit"
    exit_graphic
  end
end
#--------------------------
def exit_graphic
font = TTY::Font.new("3d")
pastel = Pastel.new
puts pastel.green(font.write("Come"))
puts pastel.cyan(font.write("Bye!"))
end
#--------------------------
