module Admins
  class BaseController < ApplicationController
    layout 'admins'

    before_action :admin_required!

    private

    def admin_required!
      redirect_to root_path, alert: 'You are not authtorized to view this page.' unless current_user.is_a?(Admin)
    end
  end
end
