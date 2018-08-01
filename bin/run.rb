require_relative '../config/environment'

feelings = [
  "angry/frustrated",
  "bored/unmotivated/tired/lazy",
  "hungry/thirsty",
  "anxious/nervous/confused",
  "lonely/sad/hopeless"
]

def run(feelings)
  welcome
  system "clear"
  name = ask_for_name
  input = ""
  input = ask_for_feeling
  if input == "Yes"
    feeling = choose_feeling(feelings) #feeling = string value of feeling choice
    puts resource_string = Resource.random(feeling) #resource_string is the the resource (string)
    save_option(name, resource_string)
    puts "Your resource has been saved!"
    goodbye
  elsif input == "No"
    goodbye
  # system "clear"
  # resource_string = body(feelings)
  # save_option(name, resource_string)
  end
end

run(feelings)
