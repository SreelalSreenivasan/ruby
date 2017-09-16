require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get l_index" do
    get login_l_index_url
    assert_response :success
  end

end
