class CreateFriendsWithResources < ActiveRecord::Migration[5.0]
  def change
    create_table :friends_with_resources do |t|
      t.integer :friend_id
      t.integer :resource_id
    end
  end
end
