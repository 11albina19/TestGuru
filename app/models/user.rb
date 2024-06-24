class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :results, dependent: :destroy
  has_many :passed_tests, through: :results, source: :test

  validates :mail, presence: true

  def user_tests_at_level(level)
    passed_tests.where(level:)
  end
end
