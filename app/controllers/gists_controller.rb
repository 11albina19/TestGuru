class GistsController < ApplicationController

  before_action :set_result, only: :create

  def create
    new_gist = GistQuestionService.new(@result.current_question, current_user).call

    flash_options = if new_gist.success?
                      { notice: "#{t('.success')}: #{new_gist.url}"}
                    else
                      { alert: t('.failure')}
                    end

    redirect_to @result, flash_options
  end

  private

  def set_result
    @result = current_user.results.find(params[:result_id])
  end
end
