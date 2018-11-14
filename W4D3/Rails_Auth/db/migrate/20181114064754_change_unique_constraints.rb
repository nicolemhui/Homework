class ChangeUniqueConstraints < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :username
    add_index :users, :username, unique: true
    add_index :users, :session_token, unique: true 
  end
end
