class GalerijasController < ApplicationController
  before_action :authenticate_user!

  def new
    @galerija = Galerija.new
  end

  def create
    @galerija = Galerija.new(galerija_params)
    if @galerija.save
      redirect_to galerija_path(@galerija), notice: "Slike so bile uspešno naložene."
    else
      render :new
    end
  end

  # Dodajte še ostale akcije: index, show, edit, update, destroy

  private

  def galerija_params
    params.require(:galerija).permit(:gallery_category_id, :description, images: [])
  end
end
