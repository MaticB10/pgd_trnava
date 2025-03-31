require "application_system_test_case"

class NovicasTest < ApplicationSystemTestCase
  setup do
    @novica = novicas(:one)
  end

  test "visiting the index" do
    visit novicas_url
    assert_selector "h1", text: "Novicas"
  end

  test "should create novica" do
    visit novicas_url
    click_on "New novica"

    fill_in "Datum", with: @novica.datum
    fill_in "Naslov", with: @novica.naslov
    fill_in "Vsebina", with: @novica.vsebina
    click_on "Create Novica"

    assert_text "Novica was successfully created"
    click_on "Back"
  end

  test "should update Novica" do
    visit novica_url(@novica)
    click_on "Edit this novica", match: :first

    fill_in "Datum", with: @novica.datum.to_s
    fill_in "Naslov", with: @novica.naslov
    fill_in "Vsebina", with: @novica.vsebina
    click_on "Update Novica"

    assert_text "Novica was successfully updated"
    click_on "Back"
  end

  test "should destroy Novica" do
    visit novica_url(@novica)
    accept_confirm { click_on "Destroy this novica", match: :first }

    assert_text "Novica was successfully destroyed"
  end
end
