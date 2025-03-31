class IntervencijasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /intervencijas or /intervencijas.json
  def index
    @intervencijas = Intervencija.all
  end

  # GET /intervencijas/1 or /intervencijas/1.json
  def show
  end

  # GET /intervencijas/new
  def new
    @intervencija = Intervencija.new
  end

  # GET /intervencijas/1/edit
  def edit
  end

  # POST /intervencijas or /intervencijas.json
  def create
    @intervencija = Intervencija.new(intervencija_params)

    respond_to do |format|
      if @intervencija.save
        format.html { redirect_to @intervencija, notice: "Intervencija was successfully created." }
        format.json { render :show, status: :created, location: @intervencija }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervencija.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intervencijas/1 or /intervencijas/1.json
  def update
    respond_to do |format|
      if @intervencija.update(intervencija_params)
        format.html { redirect_to @intervencija, notice: "Intervencija was successfully updated." }
        format.json { render :show, status: :ok, location: @intervencija }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervencija.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intervencijas/1 or /intervencijas/1.json
  def destroy
    @intervencija.destroy!

    respond_to do |format|
      format.html { redirect_to intervencijas_path, status: :see_other, notice: "Intervencija was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervencija
      @intervencija = Intervencija.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def intervencija_params
      params.expect(intervencija: [ :datum, :lokacija, :tip, :kratek_opis, :podrobnejsi_opis ])
    end
end
