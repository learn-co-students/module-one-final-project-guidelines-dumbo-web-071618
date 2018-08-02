class CreatePlaylistsongs < ActiveRecord::Migration[4.2]
  def change
    create_table :playlistsongs do |t|
      t.string :playlist
      t.string :song
    end
  end
end
