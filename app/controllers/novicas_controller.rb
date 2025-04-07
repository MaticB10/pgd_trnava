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
        redirect_to "https://pgd-trnava.eu/novicas", notice: "Novica was successfully created.", allow_other_host: true
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /novicas/1 or /novicas/1.json
  def update
    if @novica.update(novica_params)
      respond_to do |format|
        format.turbo_stream # => Renders update.turbo_stream.erb
        format.html { redirect_to @novica, notice: "Novica updated." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :edit, status: :unprocessable_entity }
        format.html { render :edit }
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
      params.require(:novica).permit(:naslov, :vsebina, :datum, images: [])
    end
    
end
