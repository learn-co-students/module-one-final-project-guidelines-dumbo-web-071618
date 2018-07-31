class AddSoldiersbattlefieldIdAndMonsteridToBattlefields < ActiveRecord::Migration[5.0]
  def change
    add_column :battlefields, :soldier_battlefield_id, :integer
    add_column :battlefields, :monster_id, :integer
  end
end
