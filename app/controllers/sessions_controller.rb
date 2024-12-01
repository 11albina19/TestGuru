class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:return_to] || tests_path
      cookies.delete(:return_to)
    else
      flash.now[:alert] = 'Вы зарегистрированы? Подтвердите, пожалуйста, свои почту и пароль'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to tests_path
  end
end
