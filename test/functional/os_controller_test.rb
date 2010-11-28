require 'test_helper'

class OsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:os)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create os" do
    assert_difference('OS.count') do
      post :create, :os => { }
    end

    assert_redirected_to os_path(assigns(:os))
  end

  test "should show os" do
    get :show, :id => os(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => os(:one).to_param
    assert_response :success
  end

  test "should update os" do
    put :update, :id => os(:one).to_param, :os => { }
    assert_redirected_to os_path(assigns(:os))
  end

  test "should destroy os" do
    assert_difference('OS.count', -1) do
      delete :destroy, :id => os(:one).to_param
    end

    assert_redirected_to os_path
  end
end
