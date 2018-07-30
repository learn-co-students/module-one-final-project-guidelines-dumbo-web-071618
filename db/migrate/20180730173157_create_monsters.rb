class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table monsters do |t|
      t.string :name
      t.integer :hp
      t.string :weaknesses
      
  end
end
