class GalerijasController < ApplicationController
  before_action :set_galerija, only: %i[ show edit update destroy ]

  # GET /galerijas or /galerijas.json
  def index
    @galerijas = Galerija.all
  end

  # GET /galerijas/1 or /galerijas/1.json
  def show
  end

  # GET /galerijas/new
  def new
    @galerija = Galerija.new
  end

  # GET /galerijas/1/edit
  def edit
  end

  # POST /galerijas or /galerijas.json
  def create
    @galerija = Galerija.new(galerija_params)

    respond_to do |format|
      if @galerija.save
        format.html { redirect_to @galerija, notice: "Galerija was successfully created." }
        format.json { render :show, status: :created, location: @galerija }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @galerija.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galerijas/1 or /galerijas/1.json
  def update
    respond_to do |format|
      if @galerija.update(galerija_params)
        format.html { redirect_to @galerija, notice: "Galerija was successfully updated." }
        format.json { render :show, status: :ok, location: @galerija }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @galerija.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galerijas/1 or /galerijas/1.json
  def destroy
    @galerija.destroy!

    respond_to do |format|
      format.html { redirect_to galerijas_path, status: :see_other, notice: "Galerija was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_galerija
      @galerija = Galerija.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def galerija_params
      params.expect(galerija: [ :gallery_category_id ])
    end
end
