def display_title
  font = TTY::Font.new("3d")
  pastel = Pastel.new
  puts pastel.green(font.write("Welcome"))
  puts pastel.yellow(font.write("to"))
  puts pastel.magenta(font.write("MusicBox"))
end

def prompt_user_status
  prompt = TTY::Prompt.new
  user_input = prompt.select("What's your status?",
    %w(New_User Current_User))

  if user_input == "New_User"
    new_user_flow
  else
    current_user_flow
  end
end

def new_user_flow
  puts "Please create username:"
  nameFromUser = gets.chomp

  if User.find_by(name: nameFromUser)
    puts "Username already taken"
    new_user_flow
  else
    object = User.create(name: nameFromUser)
    puts "New user created! Welcome, #{object.name}!"
  end
end

def current_user_flow
  puts "Please enter username:"
  nameFromUser = gets.chomp
  if User.find_by(name: nameFromUser)
    puts "Welcome back, #{nameFromUser}!"
  else
    puts "Username not found"
    current_user_flow
  end
end

def choose_action
  prompt = TTY::Prompt.new
  user_input = prompt.select("Choose your action",
    %w(Choose_Playlist Create_Playlist Delete_Playlist Go_Back))

  case user_input
  when "Choose_Playlist"
    choose_playlist_flow
  when "Create_Playlist"
    create_playlist_flow
  when "Delete_Playlist"
    delete_playlist_flow
  when "Go_back"
    go_back_from_actions
  end
end

def choose_playlist_flow
  if Playlist.all.empty?
    puts "You have no playlists, please create"
    choose_action
  else
    Playlist.all
  end
end

def create_playlist_flow

end

def delete_playlist_flow

end

def go_back_from_actions

end
