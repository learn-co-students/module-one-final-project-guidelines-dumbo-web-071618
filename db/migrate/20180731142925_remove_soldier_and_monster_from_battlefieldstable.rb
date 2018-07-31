class RemoveSoldierAndMonsterFromBattlefieldstable < ActiveRecord::Migration[5.0]
  def change
    remove_column :battlefields, :soldier
    remove_column :battlefields, :monster
  end
end
