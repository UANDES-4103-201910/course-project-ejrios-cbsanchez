require "application_system_test_case"

class AdminstratorsTest < ApplicationSystemTestCase
  setup do
    @adminstrator = adminstrators(:one)
  end

  test "visiting the index" do
    visit adminstrators_url
    assert_selector "h1", text: "Adminstrators"
  end

  test "creating a Adminstrator" do
    visit adminstrators_url
    click_on "New Adminstrator"

    fill_in "City", with: @adminstrator.city
    fill_in "Country", with: @adminstrator.country
    fill_in "Email", with: @adminstrator.email
    fill_in "Name", with: @adminstrator.name
    fill_in "Nickname", with: @adminstrator.nickname
    fill_in "Password", with: @adminstrator.password
    click_on "Create Adminstrator"

    assert_text "Adminstrator was successfully created"
    click_on "Back"
  end

  test "updating a Adminstrator" do
    visit adminstrators_url
    click_on "Edit", match: :first

    fill_in "City", with: @adminstrator.city
    fill_in "Country", with: @adminstrator.country
    fill_in "Email", with: @adminstrator.email
    fill_in "Name", with: @adminstrator.name
    fill_in "Nickname", with: @adminstrator.nickname
    fill_in "Password", with: @adminstrator.password
    click_on "Update Adminstrator"

    assert_text "Adminstrator was successfully updated"
    click_on "Back"
  end

  test "destroying a Adminstrator" do
    visit adminstrators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adminstrator was successfully destroyed"
  end
end
