class ResultsController < ApplicationController

  before_action :set_result, only: %i[show update result]

  def show; end

  def result

  end

  def update
    params_answer_ids = params[:answer_ids].present? ? params[:answer_ids] : Hash.new(0)
    @result.accept!(params_answer_ids.values)

    if @result.completed?
      redirect_to result_result_path(@result)
    else
      #@result.reload
      #render :show //так не обновляется страница
      redirect_to result_path(@result)
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
