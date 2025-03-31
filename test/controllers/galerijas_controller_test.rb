require "test_helper"

class GalerijasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @galerija = galerijas(:one)
  end

  test "should get index" do
    get galerijas_url
    assert_response :success
  end

  test "should get new" do
    get new_galerija_url
    assert_response :success
  end

  test "should create galerija" do
    assert_difference("Galerija.count") do
      post galerijas_url, params: { galerija: { gallery_category_id: @galerija.gallery_category_id } }
    end

    assert_redirected_to galerija_url(Galerija.last)
  end

  test "should show galerija" do
    get galerija_url(@galerija)
    assert_response :success
  end

  test "should get edit" do
    get edit_galerija_url(@galerija)
    assert_response :success
  end

  test "should update galerija" do
    patch galerija_url(@galerija), params: { galerija: { gallery_category_id: @galerija.gallery_category_id } }
    assert_redirected_to galerija_url(@galerija)
  end

  test "should destroy galerija" do
    assert_difference("Galerija.count", -1) do
      delete galerija_url(@galerija)
    end

    assert_redirected_to galerijas_url
  end
end
