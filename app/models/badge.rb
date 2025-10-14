class Badge < ApplicationRecord
  has_many :badge_user, dependent: :destroy
end
