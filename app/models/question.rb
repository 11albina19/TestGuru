class Question < ApplicationRecord
  belongs_to :test

  validates :body, presence: true

  validate :validate_quantity_answers

  has_many :answers, dependent: :destroy

  private

  def validate_quantity_answers
    if answers.size < 1 || answers.size > 4
      errors.add(:answers, "quantity of answers from 1 to 4")
    end
  end
end
