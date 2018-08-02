require_relative '../config/environment'

# binding.pry
#we call on the Cli class methods here.
#puts "HELLO WORLD"
welcome_graphic

sleep(1)

user = user_status

user.ask_location

options(user)
