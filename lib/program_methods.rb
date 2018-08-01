feelings = [
  "angry/frustrated",
  "bored/unmotivated/tired/lazy",
  "hungry/thirsty",
  "anxious/nervous/confused",
  "lonely/sad/hopeless"
]

options = ["Save this resource for a friend", "Exit the program", "Feel again"]

def welcome
  puts "Hello, we're here to be your ear."
end

def been_here
  prompt = TTY::Prompt.new
  input = prompt.select("Hi friend, have you been here before (or have a gift waiting for you)?", %w(Yes No))
end

def ask_for_name
    puts "Hi friend, what's your name?"
    name = gets.chomp
    system "clear"
    puts "Hi #{name}!"
    sleep(1)
    return name
end

def ask_for_name_again
    puts "Welcome! Remind me of your name again? (please use the same name you typed before)"
    name = gets.chomp
    system "clear"
    puts "Hi #{name}!"
    sleep(1)
    return name
end

def ask_for_feeling
    prompt = TTY::Prompt.new
    input = prompt.select("Would you like to feel?", %w(Yes No))
end

def choose_feeling(feelings)
  prompt = TTY::Prompt.new
  feeling = prompt.select("How do you feel? Please choose a feeling.", feelings)
  puts feeling
  return feeling
end

def do_you_want_to_save
  prompt = TTY::Prompt.new
  input = prompt.select("Would you like to keep this in your resources? If not, in the next step you'll have the option to save it for a friend.", %w(Yes No))
end

def save_option(name, resource_string)
    friend = Friend.find_or_create_by(name: name)
    friend.save_resource(resource_string)
    friend.show_resources
    puts "Your resource has been saved!"
end

def more_options(options)
  prompt = TTY::Prompt.new
  input = prompt.select("What would you like to do next?", options)
end

def ask_for_friend_name
  puts "That's so sweet! Who do you want to save it for (please type their first name)?"
  name = gets.chomp
  system "clear"
  return name
end

def save_for_friend(friend_name, resource_string)
  friend = Friend.find_or_create_by(name: friend_name)
  friend.save_resource(resource_string)
  friend.show_resources
  puts "Your gift for #{friend_name} is waiting!"
end

def goodbye
  puts "Goodbye, you beautiful you!"
end
