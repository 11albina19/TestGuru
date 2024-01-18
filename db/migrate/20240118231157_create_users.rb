class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :mail
      t.string :role
      t.string :tests_history
      t.datetime :last_visit_date
      t.datetime :registration_date

      t.timestamps
    end
  end
end
