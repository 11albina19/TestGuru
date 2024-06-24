class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_quantity_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_quantity_answers
    errors.add(:answers, 'quantity of answers from 1 to 4') if answers.count >= 4
  end
end
