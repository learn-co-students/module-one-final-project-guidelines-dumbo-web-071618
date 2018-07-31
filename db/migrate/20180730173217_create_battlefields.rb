class CreateBattlefields < ActiveRecord::Migration[5.0]
  def change
    create_table :battlefields do |t|
      t.string :name
      t.integer :monster_id
    
    end
  end
end
