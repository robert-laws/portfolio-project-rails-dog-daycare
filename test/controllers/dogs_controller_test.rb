require 'test_helper'

class DogsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dogs_show_url
    assert_response :success
  end

  test "should get edit" do
    get dogs_edit_url
    assert_response :success
  end

end
