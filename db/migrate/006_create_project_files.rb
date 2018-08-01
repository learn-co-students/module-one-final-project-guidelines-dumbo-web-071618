class CreateProjectFiles < ActiveRecord::Migration[4.2]
    def change
        create_table :project_files do |t|
            t.string :file_path, unique: true
            t.string :sha
        end
    end
end