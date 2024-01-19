class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string :body
      t.integer :points
      t.string :answers
      t.references :user_id, null: false, foreign_key: true
      t.references :test_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
