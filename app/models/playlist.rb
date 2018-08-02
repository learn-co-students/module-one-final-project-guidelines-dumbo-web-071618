class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :playlistsongs
  has_many :songs, through: :playlistsongs
  has_many :artists, through: :songs
  has_many :genres, through: :songs
end
