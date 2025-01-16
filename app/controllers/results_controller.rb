class ResultsController < ApplicationController

  before_action :set_result, only: %i[show update result]

  def show; end

  def result

  end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to result_result_path(@result)
    else
      redirect_to result_path(@result)
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
