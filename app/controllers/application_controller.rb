class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    gossips_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
      :username,
      :email,
      :password,
      :sign_up_code
      ) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(
      :username,
      :email,
      :password,
      :current_password
      ) }
  end
end
