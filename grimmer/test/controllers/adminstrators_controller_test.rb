require 'test_helper'

class AdminstratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adminstrator = adminstrators(:one)
  end

  test "should get index" do
    get adminstrators_url
    assert_response :success
  end

  test "should get new" do
    get new_adminstrator_url
    assert_response :success
  end

  test "should create adminstrator" do
    assert_difference('Adminstrator.count') do
      post adminstrators_url, params: { adminstrator: { city: @adminstrator.city, country: @adminstrator.country, email: @adminstrator.email, name: @adminstrator.name, nickname: @adminstrator.nickname, password: @adminstrator.password } }
    end

    assert_redirected_to adminstrator_url(Adminstrator.last)
  end

  test "should show adminstrator" do
    get adminstrator_url(@adminstrator)
    assert_response :success
  end

  test "should get edit" do
    get edit_adminstrator_url(@adminstrator)
    assert_response :success
  end

  test "should update adminstrator" do
    patch adminstrator_url(@adminstrator), params: { adminstrator: { city: @adminstrator.city, country: @adminstrator.country, email: @adminstrator.email, name: @adminstrator.name, nickname: @adminstrator.nickname, password: @adminstrator.password } }
    assert_redirected_to adminstrator_url(@adminstrator)
  end

  test "should destroy adminstrator" do
    assert_difference('Adminstrator.count', -1) do
      delete adminstrator_url(@adminstrator)
    end

    assert_redirected_to adminstrators_url
  end
end
