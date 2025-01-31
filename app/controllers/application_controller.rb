# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_locale

  def default_url_options
    { lang: I18n.locale }
  end

  def after_sign_in_path_for(resource)
    #stored_location_for(resource) || (resource.admin? ?  admins_tests_path : super) #сначала сделала так, но так админа перебрасывало на страницу для юзера
    return admins_tests_path if resource.admin?
    stored_location_for(resource) || super
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
