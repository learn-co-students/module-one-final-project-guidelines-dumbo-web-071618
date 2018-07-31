class CreatePlaylists < ActiveRecord::Migration[4.2]
  def change
    create_table :playlists do |t|
      t.string :user
      t.string :artist
      t.string :song
      t.string :album
      t.string :genre
    end
  end
end
