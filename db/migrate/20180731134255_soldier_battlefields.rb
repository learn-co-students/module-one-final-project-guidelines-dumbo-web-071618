class SoldierBattlefields < ActiveRecord::Migration[5.0]
  def change
    create_table :soldier_battlefields do |t|
      t.integer :soldier_id
      t.integer :battlefield_id
    end
  end
end
