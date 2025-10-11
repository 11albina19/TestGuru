class BadgesController < ApplicationController
  def index
    @badges = Badge.all
    @user_badges_id = current_user.badges.pluck(:id)
  end
end
