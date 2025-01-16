# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || (resource.admin? ?  admins_tests_path : super)
  end
end
