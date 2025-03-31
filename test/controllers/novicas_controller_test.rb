require "test_helper"

class NovicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @novica = novicas(:one)
  end

  test "should get index" do
    get novicas_url
    assert_response :success
  end

  test "should get new" do
    get new_novica_url
    assert_response :success
  end

  test "should create novica" do
    assert_difference("Novica.count") do
      post novicas_url, params: { novica: { datum: @novica.datum, naslov: @novica.naslov, vsebina: @novica.vsebina } }
    end

    assert_redirected_to novica_url(Novica.last)
  end

  test "should show novica" do
    get novica_url(@novica)
    assert_response :success
  end

  test "should get edit" do
    get edit_novica_url(@novica)
    assert_response :success
  end

  test "should update novica" do
    patch novica_url(@novica), params: { novica: { datum: @novica.datum, naslov: @novica.naslov, vsebina: @novica.vsebina } }
    assert_redirected_to novica_url(@novica)
  end

  test "should destroy novica" do
    assert_difference("Novica.count", -1) do
      delete novica_url(@novica)
    end

    assert_redirected_to novicas_url
  end
end
