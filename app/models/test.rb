class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :users, class_name: 'Result', foreign_key: :test_id

  def self.sort_tests_selection_category(category_name)
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where(categories: { title: category_name })
      .order('tests.title DESC')
      .pluck('tests.title')
  end
end
