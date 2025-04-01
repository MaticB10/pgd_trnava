class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
  
    def approve
      user = User.find(params[:id])
      user.update(approved: 1)
      redirect_to admin_dashboard_index_path, notice: "#{user.username} has been approved."
    end
  
    def reject
      user = User.find(params[:id])
      user.destroy
      redirect_to admin_dashboard_index_path, notice: "#{user.username} has been rejected and removed."
    end
  
    private
  
    def require_admin
      redirect_to root_path, alert: "Dostop ni dovoljen." unless current_user.username == "admin"
    end
  end
  