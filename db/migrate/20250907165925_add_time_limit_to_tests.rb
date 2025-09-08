class AddTimeLimitToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :time_limit, :integer, null: false, default: 0
  end
end
