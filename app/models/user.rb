class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :results, dependent: :destroy
  has_many :passed_tests, through: :results, source: :test

  def user_tests_at_level(level)
    Test.where(level: level).joins(:results)
        .where(results: { user_id: self.id })
  end
end
