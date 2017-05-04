require 'test_helper'

class UserStoryAcceptanceCriterionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_story_acceptance_criterion = user_story_acceptance_criterions(:one)
  end

  test "should get index" do
    get user_story_acceptance_criterions_url
    assert_response :success
  end

  test "should get new" do
    get new_user_story_acceptance_criterion_url
    assert_response :success
  end

  test "should create user_story_acceptance_criterion" do
    assert_difference('UserStoryAcceptanceCriterion.count') do
      post user_story_acceptance_criterions_url, params: { user_story_acceptance_criterion: { description: @user_story_acceptance_criterion.description, status: @user_story_acceptance_criterion.status, user_story_id: @user_story_acceptance_criterion.user_story_id } }
    end

    assert_redirected_to user_story_acceptance_criterion_url(UserStoryAcceptanceCriterion.last)
  end

  test "should show user_story_acceptance_criterion" do
    get user_story_acceptance_criterion_url(@user_story_acceptance_criterion)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_story_acceptance_criterion_url(@user_story_acceptance_criterion)
    assert_response :success
  end

  test "should update user_story_acceptance_criterion" do
    patch user_story_acceptance_criterion_url(@user_story_acceptance_criterion), params: { user_story_acceptance_criterion: { description: @user_story_acceptance_criterion.description, status: @user_story_acceptance_criterion.status, user_story_id: @user_story_acceptance_criterion.user_story_id } }
    assert_redirected_to user_story_acceptance_criterion_url(@user_story_acceptance_criterion)
  end

  test "should destroy user_story_acceptance_criterion" do
    assert_difference('UserStoryAcceptanceCriterion.count', -1) do
      delete user_story_acceptance_criterion_url(@user_story_acceptance_criterion)
    end

    assert_redirected_to user_story_acceptance_criterions_url
  end
end
