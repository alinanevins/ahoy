require 'test_helper'

class BadgesControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

end
