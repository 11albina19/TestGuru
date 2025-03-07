class ResultsController < ApplicationController
  before_action :set_result, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to result_result_path(@result)
    else
      redirect_to result_path(@result)
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.success?
                      { notice: t('.success', url: result.url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
