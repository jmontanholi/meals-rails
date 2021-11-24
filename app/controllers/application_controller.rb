class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    unless user_signed_in?
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to new_user_session_path, alert: exception.message }
      end
    else
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to root_path, alert: exception.message }
      end
    end
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end
end
