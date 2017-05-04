require 'test_helper'

class FunctionUserProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @function_user_project = function_user_projects(:one)
  end

  test "should get index" do
    get function_user_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_function_user_project_url
    assert_response :success
  end

  test "should create function_user_project" do
    assert_difference('FunctionUserProject.count') do
      post function_user_projects_url, params: { function_user_project: { function_id: @function_user_project.function_id, project_id: @function_user_project.project_id, user_id: @function_user_project.user_id } }
    end

    assert_redirected_to function_user_project_url(FunctionUserProject.last)
  end

  test "should show function_user_project" do
    get function_user_project_url(@function_user_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_function_user_project_url(@function_user_project)
    assert_response :success
  end

  test "should update function_user_project" do
    patch function_user_project_url(@function_user_project), params: { function_user_project: { function_id: @function_user_project.function_id, project_id: @function_user_project.project_id, user_id: @function_user_project.user_id } }
    assert_redirected_to function_user_project_url(@function_user_project)
  end

  test "should destroy function_user_project" do
    assert_difference('FunctionUserProject.count', -1) do
      delete function_user_project_url(@function_user_project)
    end

    assert_redirected_to function_user_projects_url
  end
end
