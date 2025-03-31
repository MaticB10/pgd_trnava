require "test_helper"

class IntervencijasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intervencija = intervencijas(:one)
  end

  test "should get index" do
    get intervencijas_url
    assert_response :success
  end

  test "should get new" do
    get new_intervencija_url
    assert_response :success
  end

  test "should create intervencija" do
    assert_difference("Intervencija.count") do
      post intervencijas_url, params: { intervencija: { datum: @intervencija.datum, kratek_opis: @intervencija.kratek_opis, lokacija: @intervencija.lokacija, podrobnejsi_opis: @intervencija.podrobnejsi_opis, tip: @intervencija.tip } }
    end

    assert_redirected_to intervencija_url(Intervencija.last)
  end

  test "should show intervencija" do
    get intervencija_url(@intervencija)
    assert_response :success
  end

  test "should get edit" do
    get edit_intervencija_url(@intervencija)
    assert_response :success
  end

  test "should update intervencija" do
    patch intervencija_url(@intervencija), params: { intervencija: { datum: @intervencija.datum, kratek_opis: @intervencija.kratek_opis, lokacija: @intervencija.lokacija, podrobnejsi_opis: @intervencija.podrobnejsi_opis, tip: @intervencija.tip } }
    assert_redirected_to intervencija_url(@intervencija)
  end

  test "should destroy intervencija" do
    assert_difference("Intervencija.count", -1) do
      delete intervencija_url(@intervencija)
    end

    assert_redirected_to intervencijas_url
  end
end
