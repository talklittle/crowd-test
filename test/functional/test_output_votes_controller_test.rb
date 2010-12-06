require 'test_helper'

class TestOutputVotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_output_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_output_vote" do
    assert_difference('TestOutputVote.count') do
      post :create, :test_output_vote => { }
    end

    assert_redirected_to test_output_vote_path(assigns(:test_output_vote))
  end

  test "should show test_output_vote" do
    get :show, :id => test_output_votes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => test_output_votes(:one).to_param
    assert_response :success
  end

  test "should update test_output_vote" do
    put :update, :id => test_output_votes(:one).to_param, :test_output_vote => { }
    assert_redirected_to test_output_vote_path(assigns(:test_output_vote))
  end

  test "should destroy test_output_vote" do
    assert_difference('TestOutputVote.count', -1) do
      delete :destroy, :id => test_output_votes(:one).to_param
    end

    assert_redirected_to test_output_votes_path
  end
end
