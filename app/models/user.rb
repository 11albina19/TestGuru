class User < ApplicationRecord
  serialize :tests_history, Array
end
