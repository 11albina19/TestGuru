class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string :body
      t.integer :points
      t.string :answers
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false

      t.timestamps
    end
  end
end
