class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit destroy update start]
  before_action :find_user, only: :start
  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit

  end

  def create
    @test = Test.new(test_params)
    @test.author = User.find(1)
    if @test.save
      redirect_to @test
    else
      #Rails.logger.debug "пример на будущее #{@test.errors.full_messages}, #{test_params.inspect}""
      render :new #не весь код метода, только отрендерить шаблон
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    Rails.logger.debug "!!!debug: #{@user.inspect}"
    Rails.logger.debug "!!!debug: #{@test.inspect}"
    @user.passed_tests.push(@test)
    Rails.logger.debug "!!!debug 3: #{@user.test_passage(@test).inspect}"
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
