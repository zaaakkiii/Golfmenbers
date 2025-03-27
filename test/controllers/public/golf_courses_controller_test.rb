require "test_helper"

class Public::GolfCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_golf_courses_index_url
    assert_response :success
  end

  test "should get show" do
    get public_golf_courses_show_url
    assert_response :success
  end

  test "should get new" do
    get public_golf_courses_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_golf_courses_edit_url
    assert_response :success
  end
end
