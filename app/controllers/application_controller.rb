class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  private
  
    def verify_admin_role
      return if current_user.admin?

      redirect_to root_path
    end
end
