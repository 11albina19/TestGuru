class User < ApplicationRecord

  def user_tests_at_level(level)
    Test.where(id: Result.where(user_id: self.id).select(:test_id)).where(level: level)
  end
end
