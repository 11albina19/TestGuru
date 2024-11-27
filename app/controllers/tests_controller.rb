class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show edit destroy update start]

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
      render :new
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
    @user = User.first
    @user.passed_tests.push(@test)
    redirect_to @user.return_result(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
