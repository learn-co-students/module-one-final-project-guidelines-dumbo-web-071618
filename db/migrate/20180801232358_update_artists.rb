class UpdateArtists < ActiveRecord::Migration[5.0]
  def change
    change_table :artists do |t|
      t.column :song_id, :integer
    end
  end
end
