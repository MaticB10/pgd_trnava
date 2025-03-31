require "application_system_test_case"

class GalerijasTest < ApplicationSystemTestCase
  setup do
    @galerija = galerijas(:one)
  end

  test "visiting the index" do
    visit galerijas_url
    assert_selector "h1", text: "Galerijas"
  end

  test "should create galerija" do
    visit galerijas_url
    click_on "New galerija"

    fill_in "Gallery category", with: @galerija.gallery_category_id
    click_on "Create Galerija"

    assert_text "Galerija was successfully created"
    click_on "Back"
  end

  test "should update Galerija" do
    visit galerija_url(@galerija)
    click_on "Edit this galerija", match: :first

    fill_in "Gallery category", with: @galerija.gallery_category_id
    click_on "Update Galerija"

    assert_text "Galerija was successfully updated"
    click_on "Back"
  end

  test "should destroy Galerija" do
    visit galerija_url(@galerija)
    accept_confirm { click_on "Destroy this galerija", match: :first }

    assert_text "Galerija was successfully destroyed"
  end
end
