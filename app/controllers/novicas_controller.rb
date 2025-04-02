class NovicasController < ApplicationController
  before_action :set_novica, only: %i[ show edit update destroy ]

  # GET /novicas or /novicas.json
  def index
    @novicas = Novica.all
  end

  # GET /novicas/1 or /novicas/1.json
  def show
  end

  # GET /novicas/new
  def new
    @novica = Novica.new
  end

  # GET /novicas/1/edit
  def edit
  end

  # POST /novicas or /novicas.json
  def create
    @novica = Novica.new(novica_params)
    

    respond_to do |format|
      if @novica.save
        redirect_to "https://pgd-trnava.eu/novicas", notice: "Novica was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /novicas/1 or /novicas/1.json
  def update
    respond_to do |format|
      if @novica.update(novica_params)
        format.html { redirect_to @novica, notice: "Novica was successfully updated." }
        format.json { render :show, status: :ok, location: @novica }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @novica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /novicas/1 or /novicas/1.json
  def destroy
    @novica.destroy!

    respond_to do |format|
      format.html { redirect_to novicas_path, status: :see_other, notice: "Novica was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novica
      @novica = Novica.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def novica_params
      params.expect(novica: [ :naslov, :vsebina, :datum ])
    end
end
