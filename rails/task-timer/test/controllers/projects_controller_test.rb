require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
    @user = users(:one)
  end


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    @project.description = "lorem ispum"
    @project.name = "Random"
    assert_difference('Project.count') do
      post :create, project: { description: @project.description, name: @project.name, user_id: @user }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    @project.description = "Random"
    @project.name = "Lorem Ipsum"
    @user = users(:two)
    patch :update, id: @project, project: { description: @project.description, name: @project.name, user_id: @user }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
