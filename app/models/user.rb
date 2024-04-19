class User < ApplicationRecord

  def user_tests_at_level(level)
    Test.where(level: level).joins("INNER JOIN results ON tests.id = results.test_id")
        .where(results: { user_id: self.id })
  end
end
