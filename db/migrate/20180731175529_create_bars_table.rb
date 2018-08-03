class CreateBarsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.integer :rating
      t.string :location
    end
  end
end
