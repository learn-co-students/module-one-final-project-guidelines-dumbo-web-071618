class UpdateGenres < ActiveRecord::Migration[5.0]
  def change
    change_table :genres do |t|
      t.column :song_id, :integer
    end
  end
end
