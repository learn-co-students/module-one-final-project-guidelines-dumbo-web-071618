require_relative '../config/environment'
# Welcome user
# binding.pry

def display_title
  font = TTY::Font.new("3d")
  pastel = Pastel.new
  puts pastel.green(font.write("Welcome"))
  puts pastel.yellow(font.write("to"))
  puts pastel.magenta(font.write("MusicBox"))
  sleep(5)
end

display_title
## ---------------------
#  Setup ( finding, authentication? etc)
# user = ???
current_user = User.setup_user
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

def main_menu(current_user)
  prompt = TTY::Prompt.new
  user_input = prompt.select("Choose your action",
    %w(Choose_Playlist Create_Playlist Delete_Playlist Rename_Playlist Go_Back))

  case user_input
  when "Choose_Playlist"
    if current_user.playlists.empty?
      puts "You have no playlists, please create a playlist"
      main_menu(current_user)
    else
      current_user.playlists.each do |playlist|
        puts playlist.name
      end
      puts "TYPE NAME OF PLAYLIST TO CHOOSE"
      chosen_playlist = gets.chomp
      puts "Currently in Playlist: #{chosen_playlist}"
      user_input = prompt.select("Choose your action",
        %w(Show_Songs))

      case user_input
      when "Show_Songs"
        song_info = Playlist.find_by(name: chosen_playlist).songs.map do |song|
          "Song:#{song.name}, Artist:#{song.artist.name}, Genre:#{song.genre.name}"
        end
        user_input = prompt.select("Pick Song to Play", song_info)
        case user_input
        when "Song:City Looks Pretty, Artist:Courtney Barnette, Genre:rock"
          pid = fork{ exec "afplay", "music/city_looks_pretty.mp3" }
          puts "type 'stop' to stop song"
          stop = gets.chomp
          if stop == 'stop'
            system "killall afplay"
          end
        when "Song:I'm Not Your Mother, Artist:Courtney Barnette, Genre:rock"
          pid = fork{ exec "afplay", "music/not_your_mothery.mp3" }
          puts "type 'stop' to stop song"
          stop = gets.chomp
          if stop == 'stop'
            system "killall afplay"
          end
        when "Song:Pedestrian at Best, Artist:Courtney Barnette, Genre:rock"
          pid = fork{ exec "afplay", "music/pedestrian_at_best.mp3" }
          puts "type 'stop' to stop song"
          stop = gets.chomp
          if stop == 'stop'
            system "killall afplay"
          end
        when "Song:64, Artist:Joey Vantes, Genre:rap"
          pid = fork{ exec "afplay", "music/six_four.mp3" }
          puts "type 'stop' to stop song"
          stop = gets.chomp
          if stop == 'stop'
            system "killall afplay"
          end
        when "Song:Bad, Artist:Joey Vantes, Genre:rap"
          pid = fork{ exec "afplay", "music/bad.mp3" }
          puts "type 'stop' to stop song"
          stop = gets.chomp
          if stop == 'stop'
            system "killall afplay"
          end
        when "Song:Tonight, Artist:Joey Vantes, Genre:rap"
          pid = fork{ exec "afplay", "music/tonight.mp3" }
          puts "type 'stop' to stop song"
          stop = gets.chomp
          if stop == 'stop'
            system "killall afplay"
          end
        end
      end
    end
  when "Create_Playlist"
    puts "Please enter playlist name:"
    playlist_name = gets.chomp
    Playlist.create(name: playlist_name, user: current_user)
    puts "Playlist #{playlist_name} created!"
    main_menu(current_user)
  when "Delete_Playlist"
    playlists = Playlist.where({user: current_user })
    # The way you had it
    # playlists = current_user.playlists
    playlists.each do |playlist|
      puts playlist.name
    end
    puts "TYPE NAME OF PLAYLIST YOU WANT TO DELETE"
    playlist = gets.chomp
    current_playlist = Playlist.find_by(name: playlist, user: current_user)
    Playlist.delete(current_playlist.id)
    puts "Playlist #{playlist} has been deleted!"
    main_menu(current_user)
  when "Rename_Playlist"
    playlists = Playlist.where({user: current_user })
    playlists.each do |playlist|
      puts playlist.name
    end
    puts "TYPE NAME OF PLAYLIST YOU WANT TO RENAME"
    playlist = gets.chomp
    puts "TYPE THE PLAYLIST'S NEW NAME"
    new_playlist = gets.chomp
    current_playlist = Playlist.find_by(name: playlist, user: current_user)
    puts "Playlist: #{current_playlist.name} has been renamed"
    current_playlist.name = new_playlist
    current_playlist.save
     puts "New Playlist name: #{current_playlist.name}"
    main_menu(current_user)
  when "Start Over"
    puts ""
  end
end

main_menu(current_user)

## -----------------------

# Song Controller - allow user to navigate different song features
# -CRUD
# -play song?
## -----------------------

#prompt_user_status

# choose_action

 # Find User
#main_menu(current_user)# Main Menu
# playlist menu(CRUD) || exit
# song menu (CRUD) || back || exit
