class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @pending_users = User.where(approved: 0)
  end

  private

  def ensure_admin
    # Preveri, da je trenutni uporabnik administrator
    unless current_user.username == "admin"
      redirect_to root_path, alert: "Access denied."
    end
  end
end
