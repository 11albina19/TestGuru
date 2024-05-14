class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :passed_tests, class_name: 'Result', foreign_key: :user_id
  
  def user_tests_at_level(level)
    Test.where(level: level).joins("INNER JOIN results ON tests.id = results.test_id")
        .where(results: { user_id: self.id })
  end
end
