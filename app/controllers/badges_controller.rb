class BadgesController < ApplicationController
  def index
    @badges = Badge.all #временно, потом нужен фильтр по пользователю
  end
end
