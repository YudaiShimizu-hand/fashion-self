require 'test_helper'

class FashionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fashions_new_url
    assert_response :success
  end

  test "should get index" do
    get fashions_index_url
    assert_response :success
  end

end
