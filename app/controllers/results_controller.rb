class ResultsController < ApplicationController
  before_action :set_result, only: %i[show update result gist]
  skip_before_action :verify_authenticity_token, only: [:gist]

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
    result = GistQuestionService.new(@result.current_question).call

    flash_options = if result.success?
                      { notice: t('.success', url: result.url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @result, flash_options
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
