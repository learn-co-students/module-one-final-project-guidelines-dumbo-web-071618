class CreatePlaylistsongs < ActiveRecord::Migration[4.2]
  def change
    create_table :playlistsongs do |t|
      t.integer :playlist_id
      t.integer :song_id
    end
  end
end
