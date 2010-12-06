require 'test_helper'

class ScriptVotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:script_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create script_vote" do
    assert_difference('ScriptVote.count') do
      post :create, :script_vote => { }
    end

    assert_redirected_to script_vote_path(assigns(:script_vote))
  end

  test "should show script_vote" do
    get :show, :id => script_votes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => script_votes(:one).to_param
    assert_response :success
  end

  test "should update script_vote" do
    put :update, :id => script_votes(:one).to_param, :script_vote => { }
    assert_redirected_to script_vote_path(assigns(:script_vote))
  end

  test "should destroy script_vote" do
    assert_difference('ScriptVote.count', -1) do
      delete :destroy, :id => script_votes(:one).to_param
    end

    assert_redirected_to script_votes_path
  end
end
