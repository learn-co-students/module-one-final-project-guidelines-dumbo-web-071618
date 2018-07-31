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
  system "clear"
  resource_string = body(feelings)
  save_option(name, resource_string)

end

run(feelings)
