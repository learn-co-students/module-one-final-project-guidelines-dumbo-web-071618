class RemovePlaylistColumns < ActiveRecord::Migration[5.0]
  def change
    change_table :playlists do |t|
      t.remove :user
      t.remove :playlistsong
    end
    change_table :playlists do |t|
      t.column :user_id, :integer
      t.column :playlistsong_id, :integer
    end
  end
end
