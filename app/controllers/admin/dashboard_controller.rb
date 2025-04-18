class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @pending_users = User.where(approved: 0)
  end

  private

  def require_admin
    redirect_to root_path, alert: "Dostop ni dovoljen." unless current_user.username == "admin"
  end
end
