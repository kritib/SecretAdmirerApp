class AddIndicesToTables < ActiveRecord::Migration
  def change
    add_index :users, :username, :unique => true
    add_index :users, :session_token
    add_index :comments, :post_id
    add_index :posts, :recipient_id
  end
end
