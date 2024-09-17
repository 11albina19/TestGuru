class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit destroy update]
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

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
