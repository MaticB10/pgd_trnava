class GalerijasController < ApplicationController
  # Samo prijavljeni uporabniki lahko ustvarjajo in urejajo galerije
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_galerija, only: [:show, :edit, :update, :destroy]

  def index
    @galerijas = Galerija.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @galerija = Galerija.new
  end

  def create
    @galerija = Galerija.new(galerija_params)
    if @galerija.save
      redirect_to @galerija, notice: "Galerija je bila uspešno ustvarjena."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @galerija.update(galerija_params)
      redirect_to @galerija, notice: "Galerija je bila uspešno posodobljena."
    else
      render :edit
    end
  end

  def destroy
    @galerija.destroy
    redirect_to galerijas_path, notice: "Galerija je bila uspešno izbrisana."
  end

  private

  def set_galerija
    @galerija = Galerija.find(params[:id])
  end

  def galerija_params
    params.require(:galerija).permit(:description, images: [])
  end  
end
