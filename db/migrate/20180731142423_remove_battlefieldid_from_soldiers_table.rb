class RemoveBattlefieldidFromSoldiersTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :soldiers, :battlefield_id
  end
end
