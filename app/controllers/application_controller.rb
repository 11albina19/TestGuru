# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :save_path_not_logged_in, unless: :user_signed_in?
  before_action :authenticate_user!

  private

  def save_path_not_logged_in
    if request.get? && !request.fullpath.include?('/login')
      cookies[:return_to] = request.fullpath
    end
  end
end
