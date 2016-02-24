require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "should go to index" do
    get :index
    assert_response :success
  end

  # Testes funcionais

  test "should get index" do
    get :index

    assert_response :success
    assert_select 'h1', 'Listing Tasks'
    assert_select 'th', 'Name'
  end


end
