class Question < ApplicationRecord
  belongs_to :test

  validates :body, presence: true

  validate :validate_quantity_answers

  has_many :answers, dependent: :destroy
end
