require 'test_helper'

class CommentVotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_vote" do
    assert_difference('CommentVote.count') do
      post :create, :comment_vote => { }
    end

    assert_redirected_to comment_vote_path(assigns(:comment_vote))
  end

  test "should show comment_vote" do
    get :show, :id => comment_votes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => comment_votes(:one).to_param
    assert_response :success
  end

  test "should update comment_vote" do
    put :update, :id => comment_votes(:one).to_param, :comment_vote => { }
    assert_redirected_to comment_vote_path(assigns(:comment_vote))
  end

  test "should destroy comment_vote" do
    assert_difference('CommentVote.count', -1) do
      delete :destroy, :id => comment_votes(:one).to_param
    end

    assert_redirected_to comment_votes_path
  end
end
