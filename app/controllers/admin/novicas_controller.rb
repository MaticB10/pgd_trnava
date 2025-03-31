class Admin::NovicasController < Admin::BaseController
    before_action :set_novica, only: [:show, :edit, :update, :destroy]
  
    def index
      @novicas = Novica.order(datum: :desc)
    end
  
    def show
    end
  
    def new
      @novica = Novica.new
    end
  
    def create
      @novica = Novica.new(novica_params)
      if @novica.save
        redirect_to admin_novica_path(@novica), notice: "Novica je bila uspešno ustvarjena."
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @novica.update(novica_params)
        redirect_to admin_novica_path(@novica), notice: "Novica je bila uspešno posodobljena."
      else
        render :edit
      end
    end
  
    def destroy
      @novica.destroy
      redirect_to admin_novicas_path, notice: "Novica je bila uspešno izbrisana."
    end
  
    private
  
    def set_novica
      @novica = Novica.find(params[:id])
    end
  
    def novica_params
      params.require(:novica).permit(:naslov, :vsebina, :datum)
    end
  end
  