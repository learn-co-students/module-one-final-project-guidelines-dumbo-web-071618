class CreateSoldiers < ActiveRecord::Migration[5.0]
  def change
    create_table :soldiers do |t|
      t.string :name
      t.integer :hp
      t.string :ability
      t.integer :level 

    end
  end

end
