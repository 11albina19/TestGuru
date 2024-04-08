class User < ApplicationRecord

  def user_tests_at_level(level)
    #Test.where(id: Result.where(user_id: self.id).select(:test_id)).where(level: level)
    Test.where(level: level).joins("INNER JOIN results ON tests.id = results.test_id").where(results: { user_id: self.id })
  end
end
