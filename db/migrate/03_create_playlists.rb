class CreatePlaylists < ActiveRecord::Migration[4.2]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :user
      t.string :playlistsong
    end
  end
end
