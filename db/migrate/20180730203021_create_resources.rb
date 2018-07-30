class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :feeling
      t.string :resource 
    end
  end
end
