class CreateAlbums < ActiveRecord::Migration[4.2]
  def change
    create_table :albums do |t|
      t.string :genre
      t.string :songs
      t.string :artist
    end
  end
end
