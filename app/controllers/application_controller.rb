class ApplicationController < ActionController::Base
 before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      binding.pry
      u.permit(:email, :password, :password_confirmation, :cohort)
    end

    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation, :current_password,:cohort) 
    end
  end
end
