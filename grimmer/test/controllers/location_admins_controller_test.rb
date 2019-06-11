require 'test_helper'

class LocationAdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_admin = location_admins(:one)
  end

  test "should get index" do
    get location_admins_url
    assert_response :success
  end

  test "should get new" do
    get new_location_admin_url
    assert_response :success
  end

  test "should create location_admin" do
    assert_difference('LocationAdmin.count') do
      post location_admins_url, params: { location_admin: { address: @location_admin.address, adminstrator_id: @location_admin.adminstrator_id, latitude: @location_admin.latitude, longitude: @location_admin.longitude } }
    end

    assert_redirected_to location_admin_url(LocationAdmin.last)
  end

  test "should show location_admin" do
    get location_admin_url(@location_admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_admin_url(@location_admin)
    assert_response :success
  end

  test "should update location_admin" do
    patch location_admin_url(@location_admin), params: { location_admin: { address: @location_admin.address, adminstrator_id: @location_admin.adminstrator_id, latitude: @location_admin.latitude, longitude: @location_admin.longitude } }
    assert_redirected_to location_admin_url(@location_admin)
  end

  test "should destroy location_admin" do
    assert_difference('LocationAdmin.count', -1) do
      delete location_admin_url(@location_admin)
    end

    assert_redirected_to location_admins_url
  end
end
