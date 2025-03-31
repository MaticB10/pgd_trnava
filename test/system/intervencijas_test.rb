require "application_system_test_case"

class IntervencijasTest < ApplicationSystemTestCase
  setup do
    @intervencija = intervencijas(:one)
  end

  test "visiting the index" do
    visit intervencijas_url
    assert_selector "h1", text: "Intervencijas"
  end

  test "should create intervencija" do
    visit intervencijas_url
    click_on "New intervencija"

    fill_in "Datum", with: @intervencija.datum
    fill_in "Kratek opis", with: @intervencija.kratek_opis
    fill_in "Lokacija", with: @intervencija.lokacija
    fill_in "Podrobnejsi opis", with: @intervencija.podrobnejsi_opis
    fill_in "Tip", with: @intervencija.tip
    click_on "Create Intervencija"

    assert_text "Intervencija was successfully created"
    click_on "Back"
  end

  test "should update Intervencija" do
    visit intervencija_url(@intervencija)
    click_on "Edit this intervencija", match: :first

    fill_in "Datum", with: @intervencija.datum.to_s
    fill_in "Kratek opis", with: @intervencija.kratek_opis
    fill_in "Lokacija", with: @intervencija.lokacija
    fill_in "Podrobnejsi opis", with: @intervencija.podrobnejsi_opis
    fill_in "Tip", with: @intervencija.tip
    click_on "Update Intervencija"

    assert_text "Intervencija was successfully updated"
    click_on "Back"
  end

  test "should destroy Intervencija" do
    visit intervencija_url(@intervencija)
    accept_confirm { click_on "Destroy this intervencija", match: :first }

    assert_text "Intervencija was successfully destroyed"
  end
end
