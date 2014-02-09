#
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :require_login
  skip_before_filter :require_login, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :fullname
    devise_parameter_sanitizer.for(:sign_up) << :region

    devise_parameter_sanitizer.for(:account_update) << :fullname
    devise_parameter_sanitizer.for(:account_update) << :region
  end

  def require_login
    unless current_user
      redirect_to user_session_path
    end
  end
end
