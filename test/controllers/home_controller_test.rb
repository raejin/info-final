require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get related_hashtags" do
    get :related_hashtags
    assert_response :success
  end

end
