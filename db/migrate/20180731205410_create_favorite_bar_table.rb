class CreateFavoriteBarTable < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_bars do |t|
      t.integer :user_id
      t.integer :bar_id
    end
  end
end
