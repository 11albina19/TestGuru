class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, default: false
      t.references :question_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
