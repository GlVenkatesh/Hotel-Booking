require 'test_helper'

class FixControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fix_index_url
    assert_response :success
  end

  test "should get new" do
    get fix_new_url
    assert_response :success
  end

end
