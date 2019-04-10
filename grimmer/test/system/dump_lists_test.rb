require "application_system_test_case"

class DumpListsTest < ApplicationSystemTestCase
  setup do
    @dump_list = dump_lists(:one)
  end

  test "visiting the index" do
    visit dump_lists_url
    assert_selector "h1", text: "Dump Lists"
  end

  test "creating a Dump list" do
    visit dump_lists_url
    click_on "New Dump List"

    fill_in "Post", with: @dump_list.post_id
    click_on "Create Dump list"

    assert_text "Dump list was successfully created"
    click_on "Back"
  end

  test "updating a Dump list" do
    visit dump_lists_url
    click_on "Edit", match: :first

    fill_in "Post", with: @dump_list.post_id
    click_on "Update Dump list"

    assert_text "Dump list was successfully updated"
    click_on "Back"
  end

  test "destroying a Dump list" do
    visit dump_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dump list was successfully destroyed"
  end
end
