class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  before_create :set_started_at

  SUCCESS_RATIO = 85

  def completed?
    current_question.nil?
  end

  def success_rate
    (100 / test.questions.count.to_f * correct_question).round(2)
  end

  def successful?
    success_rate >= SUCCESS_RATIO
  end

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save!
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_started_at
    self.started_at ||= Time.current
    self.finished_at = self.started_at + test.time_limit if test.time_limit.positive?
  end

  def time_is_up?
    Time.current > self.finished_at
  end
end
