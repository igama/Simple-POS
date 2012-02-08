require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  
  test "should get index" do
    sign_in users(:user1)
    get :index
    assert_response :success
  end
  
  test "index without user" do
    get :index
    assert_redirected_to :action=>"new", :controller=>"devise/sessions"
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end
end
