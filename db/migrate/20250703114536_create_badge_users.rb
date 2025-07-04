class CreateBadgeUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :badge_users do |t|
      t.references :user, foreign_key: true, null: false
      t.references :badge, foreign_key: true, null: false

      t.timestamps
    end
  end
end
