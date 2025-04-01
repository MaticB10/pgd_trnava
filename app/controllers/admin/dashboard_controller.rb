class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    # Prikaži uporabnike, ki čakajo na odobritev
    @pending_users = User.where(approved: false)
  end

  private

  def require_admin
    redirect_to root_path, alert: "Dostop ni dovoljen." unless current_user.username == "admin"
  end
end
