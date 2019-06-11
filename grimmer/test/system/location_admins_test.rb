require "application_system_test_case"

class LocationAdminsTest < ApplicationSystemTestCase
  setup do
    @location_admin = location_admins(:one)
  end

  test "visiting the index" do
    visit location_admins_url
    assert_selector "h1", text: "Location Admins"
  end

  test "creating a Location admin" do
    visit location_admins_url
    click_on "New Location Admin"

    fill_in "Address", with: @location_admin.address
    fill_in "Adminstrator", with: @location_admin.adminstrator_id
    fill_in "Latitude", with: @location_admin.latitude
    fill_in "Longitude", with: @location_admin.longitude
    click_on "Create Location admin"

    assert_text "Location admin was successfully created"
    click_on "Back"
  end

  test "updating a Location admin" do
    visit location_admins_url
    click_on "Edit", match: :first

    fill_in "Address", with: @location_admin.address
    fill_in "Adminstrator", with: @location_admin.adminstrator_id
    fill_in "Latitude", with: @location_admin.latitude
    fill_in "Longitude", with: @location_admin.longitude
    click_on "Update Location admin"

    assert_text "Location admin was successfully updated"
    click_on "Back"
  end

  test "destroying a Location admin" do
    visit location_admins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location admin was successfully destroyed"
  end
end
