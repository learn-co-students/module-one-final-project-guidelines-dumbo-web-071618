class AddPriorityColumn < ActiveRecord::Migration[4.2]
    def change
        add_column :todos, :priority, :integer
    end
end