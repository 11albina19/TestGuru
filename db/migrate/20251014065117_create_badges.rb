class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :title, foreign_key: true, null: false
      t.string :image_url, foreign_key: true, null: false
      t.string :rule_type, foreign_key: true, null: false
      t.string :parameter

      t.timestamps
    end
  end
end
