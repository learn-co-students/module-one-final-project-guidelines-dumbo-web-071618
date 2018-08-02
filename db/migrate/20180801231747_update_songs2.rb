class UpdateSongs2 < ActiveRecord::Migration[5.0]
  def change
    change_table :songs do |t|
      t.column :artist_id, :integer
      t.column :genre_id, :integer
      t.column :playlistsong_id, :integer
    end
  end
end
