class GalleryCategoriesController < ApplicationController
  before_action :set_gallery_category, only: %i[ show edit update destroy ]

  # GET /gallery_categories or /gallery_categories.json
  def index
    @gallery_categories = GalleryCategory.all
  end

  # GET /gallery_categories/1 or /gallery_categories/1.json
  def show
  end

  # GET /gallery_categories/new
  def new
    @gallery_category = GalleryCategory.new
  end

  # GET /gallery_categories/1/edit
  def edit
  end

  # POST /gallery_categories or /gallery_categories.json
  def create
    @gallery_category = GalleryCategory.new(gallery_category_params)

    respond_to do |format|
      if @gallery_category.save
        format.html { redirect_to @gallery_category, notice: "Gallery category was successfully created." }
        format.json { render :show, status: :created, location: @gallery_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gallery_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gallery_categories/1 or /gallery_categories/1.json
  def update
    respond_to do |format|
      if @gallery_category.update(gallery_category_params)
        format.html { redirect_to @gallery_category, notice: "Gallery category was successfully updated." }
        format.json { render :show, status: :ok, location: @gallery_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gallery_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_categories/1 or /gallery_categories/1.json
  def destroy
    @gallery_category.destroy!

    respond_to do |format|
      format.html { redirect_to gallery_categories_path, status: :see_other, notice: "Gallery category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery_category
      @gallery_category = GalleryCategory.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gallery_category_params
      params.expect(gallery_category: [ :name ])
    end
end
