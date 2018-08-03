class AddColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :friends_with_resources, :type, :string
  end
end
