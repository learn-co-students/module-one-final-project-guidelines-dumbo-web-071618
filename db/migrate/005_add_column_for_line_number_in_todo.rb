class AddColumnForLineNumberInTodo < ActiveRecord::Migration[4.2]

  def change
    add_column :todos, :line_number, :integer
  end

end
