class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :playlists, through: :playlistsongs
  has_many :playlistsongs
end
