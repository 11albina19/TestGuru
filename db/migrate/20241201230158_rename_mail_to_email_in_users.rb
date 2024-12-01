class RenameMailToEmailInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :mail, :email
  end
end
