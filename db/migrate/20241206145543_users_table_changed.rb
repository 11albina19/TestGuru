class UsersTableChanged < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :password, :password_digest
    rename_column :users, :mail, :email
    add_index :users, :email, unique: true
  end
end
