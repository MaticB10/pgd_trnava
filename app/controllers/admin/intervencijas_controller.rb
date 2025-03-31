class Admin::IntervencijasController < Admin::BaseController
    before_action :set_intervencija, only: [:show, :edit, :update, :destroy]
  
    def index
      @intervencijas = Intervencija.order(datum: :desc)
    end
  
    def show
    end
  
    def new
      @intervencija = Intervencija.new
    end
  
    def create
      @intervencija = Intervencija.new(intervencija_params)
      if @intervencija.save
        redirect_to admin_intervencija_path(@intervencija), notice: "Intervencija je bila uspešno ustvarjena."
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @intervencija.update(intervencija_params)
        redirect_to admin_intervencija_path(@intervencija), notice: "Intervencija je bila uspešno posodobljena."
      else
        render :edit
      end
    end
  
    def destroy
      @intervencija.destroy
      redirect_to admin_intervencijas_path, notice: "Intervencija je bila uspešno izbrisana."
    end
  
    private
  
    def set_intervencija
      @intervencija = Intervencija.find(params[:id])
    end
  
    def intervencija_params
      params.require(:intervencija).permit(:datum, :lokacija, :tip, :kratek_opis, :podrobnejsi_opis)
    end
  end
  