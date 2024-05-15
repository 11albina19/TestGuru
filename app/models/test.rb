class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, foreign_key: :test_id
  has_many :users, through: :results

  def self.sort_tests_selection_category(category_name)
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where(categories: { title: category_name })
      .order('tests.title DESC')
      .pluck('tests.title')
  end
end
