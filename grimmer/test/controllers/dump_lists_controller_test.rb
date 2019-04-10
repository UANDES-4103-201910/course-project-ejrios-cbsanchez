require 'test_helper'

class DumpListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dump_list = dump_lists(:one)
  end

  test "should get index" do
    get dump_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_dump_list_url
    assert_response :success
  end

  test "should create dump_list" do
    assert_difference('DumpList.count') do
      post dump_lists_url, params: { dump_list: { post_id: @dump_list.post_id } }
    end

    assert_redirected_to dump_list_url(DumpList.last)
  end

  test "should show dump_list" do
    get dump_list_url(@dump_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_dump_list_url(@dump_list)
    assert_response :success
  end

  test "should update dump_list" do
    patch dump_list_url(@dump_list), params: { dump_list: { post_id: @dump_list.post_id } }
    assert_redirected_to dump_list_url(@dump_list)
  end

  test "should destroy dump_list" do
    assert_difference('DumpList.count', -1) do
      delete dump_list_url(@dump_list)
    end

    assert_redirected_to dump_lists_url
  end
end
