require "test_helper"

class OthersControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get others_about_url
    assert_response :success
  end
end
