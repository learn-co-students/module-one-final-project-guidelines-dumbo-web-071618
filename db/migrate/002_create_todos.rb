class CreateTodos < ActiveRecord::Migration[4.2]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :file_path
      t.string :comment
      t.integer :category_id
    end
  end
end
