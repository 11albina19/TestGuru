class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :password, null: false
      t.string :mail
      t.string :role, null: false
      t.string :tests_history
      t.datetime :last_visit_date
      t.datetime :registration_date

      t.timestamps
    end
  end
end
