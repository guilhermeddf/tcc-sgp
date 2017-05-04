require 'test_helper'

class UserAbilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_ability = user_abilities(:one)
  end

  test "should get index" do
    get user_abilities_url
    assert_response :success
  end

  test "should get new" do
    get new_user_ability_url
    assert_response :success
  end

  test "should create user_ability" do
    assert_difference('UserAbility.count') do
      post user_abilities_url, params: { user_ability: { ability_id: @user_ability.ability_id, user_id: @user_ability.user_id } }
    end

    assert_redirected_to user_ability_url(UserAbility.last)
  end

  test "should show user_ability" do
    get user_ability_url(@user_ability)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_ability_url(@user_ability)
    assert_response :success
  end

  test "should update user_ability" do
    patch user_ability_url(@user_ability), params: { user_ability: { ability_id: @user_ability.ability_id, user_id: @user_ability.user_id } }
    assert_redirected_to user_ability_url(@user_ability)
  end

  test "should destroy user_ability" do
    assert_difference('UserAbility.count', -1) do
      delete user_ability_url(@user_ability)
    end

    assert_redirected_to user_abilities_url
  end
end
