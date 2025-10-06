module Admins
  class BadgesController < Admins::BaseController
    skip_before_action :authenticate_user!
    before_action :find_badges, only: %i[index]
    before_action :find_badge, only: %i[show edit destroy update]

    def index; end

    def show
      #@questions = @test.questions
    end

    def new
      @badge = Badge.new
    end

    def edit; end

    def create
      @badge = Badge.new(badge_params)
      if @badge.save
        redirect_to admins_badge_path(@badge), notice: t('.success')
      else
        render :new
      end
    end

    def update
      if @badge.update(badge_params)
        redirect_to admins_badges_path(@badge)
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy
      redirect_to admins_badges_path
    end

    private

    def find_badges
      @badges = Badge.all
    end

    def find_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:title, :image_url, :rule_type, :parameter)
    end
  end
end
