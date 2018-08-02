class Playlistsong < ActiveRecord::Base
  has_many :playlists
  has_many :songs
  has_many :genres, through: :songs
  has_many :artists, through: :songs
  has_many :users, through: :playlists
end
