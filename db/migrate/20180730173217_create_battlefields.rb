class CreateBattlefields < ActiveRecord::Migration[5.0]
  def change
    create_table :battlefields do |t|
      t.string :battlefield_name
      t.string :soldier
      t.string :monster
    end
  end
end
