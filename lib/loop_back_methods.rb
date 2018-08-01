

def feel_again_loop(feelings,feeling,name,resource_string,options)
  feeling = choose_feeling(feelings) #feeling = string value of feeling choice
  puts resource_string = Resource.random(feeling) #resource_string is the the resource (string)
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
