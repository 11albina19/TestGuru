class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def edit
    @test = Test.find(params[:id])
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
    @test = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
