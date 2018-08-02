class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  belongs_to :playlistsong

  def artist
    Artist.find(self.artist_id)
  end
end
