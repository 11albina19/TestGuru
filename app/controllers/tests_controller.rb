class TestsController < ApplicationController
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    current_user.passed_tests.push(@test)
    redirect_to current_user.return_result(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
