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
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end

    cookies[:email] = current_user&.email
    cookies[:user_id] = current_user&.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    session.delete(:user_id)
    @current_user = nil
  end
end
