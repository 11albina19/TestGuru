class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :password, null: false
      t.string :mail, null: false

      t.timestamps
    end
  end
end
