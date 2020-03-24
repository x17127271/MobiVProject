require 'test_helper'

class RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get register_signin_url
    assert_response :success
  end

  test "should get signup" do
    get register_signup_url
    assert_response :success
  end

end
