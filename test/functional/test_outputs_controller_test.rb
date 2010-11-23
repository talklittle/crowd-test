require 'test_helper'

class TestOutputsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_outputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_output" do
    assert_difference('TestOutput.count') do
      post :create, :test_output => { }
    end

    assert_redirected_to test_output_path(assigns(:test_output))
  end

  test "should show test_output" do
    get :show, :id => test_outputs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => test_outputs(:one).to_param
    assert_response :success
  end

  test "should update test_output" do
    put :update, :id => test_outputs(:one).to_param, :test_output => { }
    assert_redirected_to test_output_path(assigns(:test_output))
  end

  test "should destroy test_output" do
    assert_difference('TestOutput.count', -1) do
      delete :destroy, :id => test_outputs(:one).to_param
    end

    assert_redirected_to test_outputs_path
  end
end
