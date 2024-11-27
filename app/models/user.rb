require 'digest/sha1'

class User < ApplicationRecord

  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :results, dependent: :destroy
  has_many :passed_tests, through: :results, source: :test

  has_secure_password

  def user_tests_at_level(level)
    passed_tests.where(level:)
  end

  def return_result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
