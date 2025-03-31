require "test_helper"

class GalleryCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gallery_category = gallery_categories(:one)
  end

  test "should get index" do
    get gallery_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_gallery_category_url
    assert_response :success
  end

  test "should create gallery_category" do
    assert_difference("GalleryCategory.count") do
      post gallery_categories_url, params: { gallery_category: { name: @gallery_category.name } }
    end

    assert_redirected_to gallery_category_url(GalleryCategory.last)
  end

  test "should show gallery_category" do
    get gallery_category_url(@gallery_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_gallery_category_url(@gallery_category)
    assert_response :success
  end

  test "should update gallery_category" do
    patch gallery_category_url(@gallery_category), params: { gallery_category: { name: @gallery_category.name } }
    assert_redirected_to gallery_category_url(@gallery_category)
  end

  test "should destroy gallery_category" do
    assert_difference("GalleryCategory.count", -1) do
      delete gallery_category_url(@gallery_category)
    end

    assert_redirected_to gallery_categories_url
  end
end
