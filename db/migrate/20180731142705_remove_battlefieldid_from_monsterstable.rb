class RemoveBattlefieldidFromMonsterstable < ActiveRecord::Migration[5.0]
  def change
    remove_column :monsters, :battlefield_id
  end
end
