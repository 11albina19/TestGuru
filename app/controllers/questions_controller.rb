class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show]

  def index
    @questions = @test.questions
    render html: @questions.map(&:body).join("\n")
  end

  def show
    render inline: '<%= @question.body %>'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
