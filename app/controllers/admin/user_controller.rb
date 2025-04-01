class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin
  before_action :set_user, only: [:approve, :reject]

  def approve
    if @user.update(approved: 1)  # nastavite na 1, kar pomeni potrjen
      redirect_to dashboard_path, notice: "Uporabnik je bil uspešno potrjen."
    else
      redirect_to dashboard_path, alert: "Pri potrjevanju uporabnika je prišlo do napake."
    end
  end

  def reject
    if @user.update(approved: 0)  # ali pa odstranite, odvisno od vaše logike
      redirect_to dashboard_path, notice: "Uporabnik je bil zavrnjen."
    else
      redirect_to dashboard_path, alert: "Pri zavrnitvi uporabnika je prišlo do napake."
    end
  end

  private

  def ensure_admin
    unless current_user.username == "admin"
      redirect_to root_path, alert: "Access denied."
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
