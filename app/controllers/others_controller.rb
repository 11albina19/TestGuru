class OthersController < ApplicationController
  def about
    @thinknetica_link = "https://thinknetica.com/"
  end

  def author
    @author = "junior Ruby, Сафина Альбина"
    @education = "УлГТУ, программная инженерия (2019-2023). В настоящее время проходит обучение в онлайн-школе Thinknetica"
    @profile_link = "https://github.com/11albina19"
  end
end
