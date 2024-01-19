class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      add_reference :category, foreign_key: true

      t.timestamps
    end
  end
end
