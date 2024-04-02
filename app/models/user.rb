class User < ApplicationRecord
  has_many :results

  def tests(level)
    Test.where(id: Result.where(user_id: self.id).select(:test_id)).where(level: level)
  end
end
