class CreateFiles < ActiveRecord::Migration[4.2]
    def change
        create_table :files do |t|
            t.string :file_path
            t.string :sha
        end
    end
end