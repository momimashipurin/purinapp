require "test_helper"

class Admin::ItemesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_itemes_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_itemes_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_itemes_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_itemes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_itemes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_itemes_update_url
    assert_response :success
  end
end
