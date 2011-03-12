require 'test_helper'

class HooksControllerTest < ActionController::TestCase
  test "should get gems" do
    get :gems
    assert_response :success
  end

end
