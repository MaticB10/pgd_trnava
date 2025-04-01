class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin
  before_action :set_user, only: [:approve, :reject]

  def approve
    if @user.update(approved: 1)
      redirect_to admin_dashboard_index_path, notice: "Uporabnik je bil uspešno potrjen."
    else
      redirect_to admin_dashboard_index_path, alert: "Pri potrjevanju uporabnika je prišlo do napake."
    end
  end

  def reject
    if @user.update(approved: 0)
      redirect_to admin_dashboard_index_path, notice: "Uporabnik je bil zavrnjen."
    else
      redirect_to admin_dashboard_index_path, alert: "Pri zavrnitvi uporabnika je prišlo do napake."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
