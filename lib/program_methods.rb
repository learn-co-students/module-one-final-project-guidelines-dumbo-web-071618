feelings = [
  "angry/frustrated",
  "bored/unmotivated/tired/lazy",
  "hungry/thirsty",
  "anxious/nervous/confused",
  "lonely/sad/hopeless"
]

def welcome
  puts "Hello, we're here to be your ear."
end

def help
  puts "If you don't want to feel anymore, just type 'exit'"
end

def ask_for_name
  puts "Hi friend, what's your name?"
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

def save_option(name, resource_string)
  prompt = TTY::Prompt.new
  input = prompt.select("Would you like to save this resource?", %w(Yes No))
    if input == "No"
      goodbye
    elsif input == "Yes"
      friend = Friend.create(name: name)
      friend.save_resource(resource_string)
      friend.show_resources
    end
end

def invalid_input
  puts "Oops! Please type something valid."
end

def goodbye
  puts "Goodbye, you beautiful you!"
end
