class CreateSoldiers < ActiveRecord::Migration[5.0]
  def change
    create_table :soldiers do |t|
      t.string :name
      t.integer :hp
      t.integer :rank
      t.integer :weapon
    end

  end
end
