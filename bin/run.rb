require_relative '../config/environment'

feelings = [
  "angry/frustrated",
  "bored/unmotivated/tired/lazy",
  "hungry/thirsty",
  "anxious/nervous/confused",
  "lonely/sad/hopeless"
]
options = ["Save this resource for a friend", "Exit the program", "Feel again"]

def run(feelings, options)
  welcome
  input = been_here
  if input == "Yes" #asking if they've been here before
    name = ask_for_name_again
    Friend.friend_exists(name)
  elsif input == "No" #asking if they've been here before
    name = ask_for_name
    input = ""
    input = ask_for_feeling #asking if they want to feel
    if input == "Yes"
      feeling = choose_feeling(feelings) #feeling = string value of feeling choice
      puts resource_string = Resource.random(feeling) #resource_string is the the resource (string)
      input = do_you_want_to_save #asking if they want to save resource
        if input == "Yes"
          save_option(name, resource_string)
          input = more_options(options) #asking more options
            if input == "Save this resource for a friend"
              friend_name = ask_for_friend_name
              save_for_friend(friend_name, resource_string)
            elsif input == "Feel again"
              feel_again_loop(feelings,feeling,name,resource_string,options)
            elsif input == "Exit the program"
              goodbye
            end
        elsif input == "No" #asking if they want to save resources
          input = more_options(options)
            if input == "Save this resource for a friend"
              friend_name = ask_for_friend_name
              save_for_friend(friend_name, resource_string)
            elsif input == "Exit the program"
              goodbye
            elsif input == "Feel again"
              feel_again_loop(feelings,feeling,name,resource_string,options)  
            end
    elsif input == "No" #asking if they want to feel
        goodbye
    end
  end
end
end

run(feelings, options)
