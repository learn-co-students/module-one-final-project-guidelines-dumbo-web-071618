require_relative '../config/environment'
# Welcome user
# binding.pry

def display_title
  font = TTY::Font.new("3d")
  pastel = Pastel.new
  puts pastel.green(font.write("Welcome"))
  puts pastel.yellow(font.write("to"))
  puts pastel.magenta(font.write("MusicBox"))
  sleep(1)
  system "clear"
end

display_title
## ---------------------
#  Setup ( finding, authentication? etc)
# user = ???
## ---------------------

# Main Controller - allow user to navigate to different features of program
# if user selects this
# #see_my_playlists? --> playlist_controller
# #user_profile ---->
# etc...
## ----------------------


# Playlist Controller - allow user to navigate different playlist features

# - CRUD
# - #play_all_songs
# - see all songs?

## -----------------------

# Song Controller - allow user to navigate different song features
# -CRUD
# -play song?
## -----------------------

#prompt_user_status

# choose_action

current_user = User.setup_user # Find User
Playlist.main_menu(current_user)# Main Menu
# playlist menu(CRUD) || exit
# song menu (CRUD) || back || exit
