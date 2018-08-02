class UpdateSongs < ActiveRecord::Migration[5.0]
  def change
    change_table :songs do |t|
      t.remove :artist
      t.remove :genre
    end
  end
end
