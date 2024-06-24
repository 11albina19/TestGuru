class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true,
                    uniqueness: true

  validates :level, numericality: { only_integer: true, greater_than: 0 },
                    uniqueness: true

  scope :easy, -> { where(level: [0..1]) }
  scope :medium, -> { where(level: [2..4]) }
  scope :hard, -> { where(level: [5..Float::INFINITY]) }
  scope :by_category, -> (category_name) { joins(:category).where(categories: { title: category_name }) }

  def self.sort_tests_selection_category(category_name)
    by_category(category_name)
      .order(title: :desc)
      .pluck(:title)
  end
end
