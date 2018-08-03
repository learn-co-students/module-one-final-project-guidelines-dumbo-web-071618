require_relative '../config/environment'

feelings = [
  "angry/frustrated",
  "bored/unmotivated/tired/lazy",
  "hungry/thirsty",
  "anxious/nervous/confused",
  "lonely/sad/hopeless",
  "happy/grateful/joyful",
  "determined/committed/eager",
  "code-hungry",
  "insecure/unconfident"
]

options = ["Save this resource for a friend", "Feel again", "Exit the program"]


def run(feelings, options)
  system "clear"
  pastel = Pastel.new
  font = TTY::Font.new(:doom)
  puts font.write("Ear 4 u")
  welcome
  input = been_here
  if input == "Yes" #asking if they've been here before
    name = ask_for_name_again
    Friend.friend_exists(name)
    play_again_loop(feelings,options, name)
  elsif input == "No" #asking if they've been here before
    name = ask_for_name
    input = ""
    input = ask_for_feeling #asking if they want to feel
    if input == "Yes"
      feeling = choose_feeling(feelings) #feeling = string value of feeling choice
      puts pastel.yellow(resource_string = Resource.random(feeling)) #resource_string is the the resource (string)
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
          end
    elsif input == "No" #asking if they want to feel
        goodbye
    end
  end
end

run(feelings, options)
