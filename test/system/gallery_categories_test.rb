require "application_system_test_case"

class GalleryCategoriesTest < ApplicationSystemTestCase
  setup do
    @gallery_category = gallery_categories(:one)
  end

  test "visiting the index" do
    visit gallery_categories_url
    assert_selector "h1", text: "Gallery categories"
  end

  test "should create gallery category" do
    visit gallery_categories_url
    click_on "New gallery category"

    fill_in "Name", with: @gallery_category.name
    click_on "Create Gallery category"

    assert_text "Gallery category was successfully created"
    click_on "Back"
  end

  test "should update Gallery category" do
    visit gallery_category_url(@gallery_category)
    click_on "Edit this gallery category", match: :first

    fill_in "Name", with: @gallery_category.name
    click_on "Update Gallery category"

    assert_text "Gallery category was successfully updated"
    click_on "Back"
  end

  test "should destroy Gallery category" do
    visit gallery_category_url(@gallery_category)
    accept_confirm { click_on "Destroy this gallery category", match: :first }

    assert_text "Gallery category was successfully destroyed"
  end
end
