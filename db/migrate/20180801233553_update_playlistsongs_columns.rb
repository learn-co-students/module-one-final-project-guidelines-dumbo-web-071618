class UpdatePlaylistsongsColumns < ActiveRecord::Migration[5.0]
  def change
    change_table :playlistsongs do |t|
      t.remove :playlist
      t.remove :song
    end
    change_table :playlistsongs do |t|
      t.column :playlist_id, :integer
      t.column :song_id, :integer
    end
  end
end
