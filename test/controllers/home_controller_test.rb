require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get select" do
    get home_select_url
    assert_response :success
  end

  test "should get full_view" do
    get home_full_view_url
    assert_response :success
  end

end
