class CreateProject < ActiveRecord::Migration[4.2]
    def change
        create_table :projects do |t|
            t.string :project_path
        end
    end
end