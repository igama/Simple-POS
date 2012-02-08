require 'test_helper'

class EmployeeDetailsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:user1)
    @employee_detail = employee_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_detail" do
    assert_difference('EmployeeDetail.count') do
      post :create, employee_detail: @employee_detail.attributes
    end

    assert_redirected_to employee_detail_path(assigns(:employee_detail))
  end

  test "should show employee_detail" do
    get :show, id: @employee_detail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_detail.to_param
    assert_response :success
  end

  test "should update employee_detail" do
    put :update, id: @employee_detail.to_param, employee_detail: @employee_detail.attributes
    assert_redirected_to employee_detail_path(assigns(:employee_detail))
  end

  test "should destroy employee_detail" do
    assert_difference('EmployeeDetail.count', -1) do
      delete :destroy, id: @employee_detail.to_param
    end

    assert_redirected_to employee_details_path
  end
end
