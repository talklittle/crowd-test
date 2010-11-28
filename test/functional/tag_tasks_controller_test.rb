require 'test_helper'

class TagTasksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_task" do
    assert_difference('TagTask.count') do
      post :create, :tag_task => { }
    end

    assert_redirected_to tag_task_path(assigns(:tag_task))
  end

  test "should show tag_task" do
    get :show, :id => tag_tasks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tag_tasks(:one).to_param
    assert_response :success
  end

  test "should update tag_task" do
    put :update, :id => tag_tasks(:one).to_param, :tag_task => { }
    assert_redirected_to tag_task_path(assigns(:tag_task))
  end

  test "should destroy tag_task" do
    assert_difference('TagTask.count', -1) do
      delete :destroy, :id => tag_tasks(:one).to_param
    end

    assert_redirected_to tag_tasks_path
  end
end
