class FeedbacksController < ApplicationController
  def new
  end

  def create
    user_text = params[:user]
    feedback_text = params[:feedback]
   
    FeedbackMailer.contact(@user_text, feedback_text).deliver_now
    
    flash[:notice] = "Сообщение отправлено"
    redirect_to root_path
  end
end
