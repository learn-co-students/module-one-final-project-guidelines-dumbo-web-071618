

def feel_again_loop(feelings,feeling,name,resource_string,options)
  pastel = Pastel.new
  feeling = choose_feeling(feelings) #feeling = string value of feeling choice
  puts pastel.yellow(resource_string = Resource.random(feeling)) #resource_string is the the resource (string)
  input = do_you_want_to_save #asking if they want to save resource
    if input == "Yes"
      save_option(name, resource_string)
      input = more_options(options) #asking more options
          if input == "Feel again"
            feel_again_loop(feelings,feeling,name,resource_string,options)
          elsif input == "Save this resource for a friend"
            friend_name = ask_for_friend_name
            save_for_friend(friend_name, resource_string)
          elsif input == "Exit the program"
            goodbye
          end
     elsif input == "No"
       input = more_options(options) #asking more options
           if input == "Feel again"
             feel_again_loop(feelings,feeling,name,resource_string,options)
           elsif input == "Save this resource for a friend"
             friend_name = ask_for_friend_name
             save_for_friend(friend_name, resource_string)
           elsif input == "Exit the program"
             goodbye
           end
     end
end

def play_again_loop(feelings,options, name)
  pastel = Pastel.new
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
