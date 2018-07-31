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
    puts "Would you like to feel? Please type 'yes' or 'no'"
    input = gets.chomp.downcase
end




def choose_feeling(feelings)
  prompt = TTY::Prompt.new
  #feelings = feelings_list(feelings)
  feeling = prompt.select("How do you feel? Please choose a feeling.", feelings)
  puts feeling
  return feeling
end

def resource(feeling_choice)
    feeling_match = Resource.all.select {|resource| resource.feeling == feeling_choice}
    resource = feeling_match.map {|f| f.resource}.sample
end

def save_option(name, resource_string)
  puts "Would you like to save this resource? Enter 'yes' or 'no'"
    input = gets.chomp.downcase
    if input == "no"
      goodbye
    elsif input != "yes" && input != "no"
      invalid_input
      save_option(name, resource_string)
    elsif input == "yes"
      saved_session = FriendsWithResource.new
      saved_friend = Friend.create(name: name)

      saved_resource = Resource.where(resource: resource_string)[0]
      saved_session.resource = saved_resource
      saved_session.friend = saved_friend
      saved_session.save

    end
end

def invalid_input
  puts "Oops! Please type something valid."
end

def goodbye
  puts "Goodbye, you beautiful you!"
end


def body(feelings)
  input = ask_for_feeling
  if input == "no"
    goodbye
  elsif input == "yes"
     feeling_choice = choose_feeling(feelings)
     system "clear"
     puts resource(feeling_choice)
     return resource(feeling_choice)
   elsif input != "yes" && input != "no"
     invalid_input
     body(feelings)
   end
end
