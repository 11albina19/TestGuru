class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :results, dependent: :destroy
  has_many :passed_tests, through: :results, source: :test

  validates :mail, presence: true

  scope :user_tests_at_level, -> (level) { self.passed_tests.where(level: level) }

  #def user_tests_at_level(level)
  #  self.passed_tests.where(level: level)
  #end
end
