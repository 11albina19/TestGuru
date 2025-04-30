module Admins
  class TestsController < Admins::BaseController
    skip_before_action :authenticate_user!
    before_action :find_tests, only: %i[index update_inline]
    before_action :find_test, only: %i[show edit destroy update start update_inline]

    def index
      @tests = Test.all
    end

    def show
      @questions = @test.questions
    end

    def new
      @test = Test.new
    end

    def edit; end

    def create
      @test = Test.new(test_params)
      @test.author = current_user
      if @test.save
        redirect_to admins_test_path(@test), notice: t('.success')
      else
        render :new
      end
    end

    def update
      if @test.update(test_params)
        redirect_to admins_test_path(@test)
      else
        render :edit
      end
    end

    def update_inline
      if @test.update(test_params)
        redirect_to admin_tests_path(@test)
      else
        render :index
      end
    end

    def destroy
      @test.destroy
      redirect_to admins_tests_path
    end

    private

    def find_tests
      @tests = Test.all
    end

    def find_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:title, :level, :category_id)
    end
  end
end
