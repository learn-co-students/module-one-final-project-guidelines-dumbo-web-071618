class CreateBattlefields < ActiveRecord::Migration[5.0]
  def change
    create_table :battlefield do |t|
      t.string :name
      t.integer :hp
      t.string :ability
      t.integer :battlefield_id
    end
  end
end
