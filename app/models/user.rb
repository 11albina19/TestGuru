class User < ApplicationRecord

  def tests(level)
    test_id = Result.where(user_id: self.id).pluck(:test_id)
    Test.where(id: test_id, level: level)
  end
end
