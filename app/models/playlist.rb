class Playlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlistsong
end
