class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :playlistsongs
  has_many :songs, through: :playlistsongs
  has_many :artists, through: :songs
  has_many :genres, through: :songs

  # show all songs

  def self.main_menu(current_user)
    prompt = TTY::Prompt.new
    user_input = prompt.select("Choose your action",
      %w(Choose_Playlist Create_Playlist Delete_Playlist Go_Back))

    case user_input
    when "Choose_Playlist"
      if current_user.playlists.empty?
        puts "You have no playlists, please create a playlist"
        main_menu(current_user)
      end
      current_user.playlists.each do |playlist|
        puts playlist.name
      end
    when "Create_Playlist"
      puts "Please enter playlist name:"
      playlist_name = gets.chomp
      Playlist.create(name: playlist_name, user: current_user)
      puts "Playlist #{playlist_name} created!"
      main_menu(current_user)
    when "Delete_Playlist"
      delete_playlist_flow
    when "Edit_Playlist"
    when "Go_back"
      go_back_from_actions
    end
  end
end
