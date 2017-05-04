require 'test_helper'

class TaskRequirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_requirement = task_requirements(:one)
  end

  test "should get index" do
    get task_requirements_url
    assert_response :success
  end

  test "should get new" do
    get new_task_requirement_url
    assert_response :success
  end

  test "should create task_requirement" do
    assert_difference('TaskRequirement.count') do
      post task_requirements_url, params: { task_requirement: { ability_id: @task_requirement.ability_id, level: @task_requirement.level, task_id: @task_requirement.task_id } }
    end

    assert_redirected_to task_requirement_url(TaskRequirement.last)
  end

  test "should show task_requirement" do
    get task_requirement_url(@task_requirement)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_requirement_url(@task_requirement)
    assert_response :success
  end

  test "should update task_requirement" do
    patch task_requirement_url(@task_requirement), params: { task_requirement: { ability_id: @task_requirement.ability_id, level: @task_requirement.level, task_id: @task_requirement.task_id } }
    assert_redirected_to task_requirement_url(@task_requirement)
  end

  test "should destroy task_requirement" do
    assert_difference('TaskRequirement.count', -1) do
      delete task_requirement_url(@task_requirement)
    end

    assert_redirected_to task_requirements_url
  end
end
