require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success

  end

  test "should get the right title in home page" do
    get :home
    assert_select "title", "Home"
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get the right title in about page" do
    get :about
    assert_select "title", "About"
  end

  test "should get directions" do
    get :directions
    assert_response :success
  end

  test "should get the right title in directions page" do
    get :directions
    assert_select "title", "Directions"
  end

end
