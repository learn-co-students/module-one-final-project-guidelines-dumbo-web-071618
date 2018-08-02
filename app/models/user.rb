class User < ActiveRecord::Base
  has_many :playlists
  has_many :playlistsongs, through: :playlists
end
