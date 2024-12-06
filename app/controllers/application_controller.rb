# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?

  before_action :save_path_not_logged_in, unless: :logged_in?
  before_action :authenticate_user!

  private

  def save_path_not_logged_in
    if request.get? && !request.fullpath.include?('/login')
      cookies[:return_to] = request.fullpath
    end
  end

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: 'Вы зарегистрированы? Проверьте, пожалуйста, свои почту и пароль'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
