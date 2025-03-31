class Admin::GalleryCategoriesController < Admin::BaseController
    before_action :set_gallery_category, only: [:show, :edit, :update, :destroy]
  
    def index
      @gallery_categories = GalleryCategory.order(:name)
    end
  
    def show
    end
  
    def new
      @gallery_category = GalleryCategory.new
    end
  
    def create
      @gallery_category = GalleryCategory.new(gallery_category_params)
      if @gallery_category.save
        redirect_to admin_gallery_category_path(@gallery_category), notice: "Kategorija slik je bila uspešno ustvarjena."
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @gallery_category.update(gallery_category_params)
        redirect_to admin_gallery_category_path(@gallery_category), notice: "Kategorija slik je bila uspešno posodobljena."
      else
        render :edit
      end
    end
  
    def destroy
      @gallery_category.destroy
      redirect_to admin_gallery_categories_path, notice: "Kategorija slik je bila uspešno izbrisana."
    end
  
    private
  
    def set_gallery_category
      @gallery_category = GalleryCategory.find(params[:id])
    end
  
    def gallery_category_params
      params.require(:gallery_category).permit(:name)
    end
  end
  