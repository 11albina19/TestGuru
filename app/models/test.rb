class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.sort_tests_selection_category(category_name)
    joins(:category)
      .where(categories: { title: category_name })
      .order('tests.title DESC')
      .pluck('tests.title')
  end
end
