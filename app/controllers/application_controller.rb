#
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :require_login
  skip_before_filter :require_login, if: :devise_controller?

  after_action :update_last_activity

  protected

  def configure_permitted_parameters
    sign_up_sanitizer << :fullname
    sign_up_sanitizer << :region

    account_update_sanitizer << :fullname
    account_update_sanitizer << :region
    account_update_sanitizer << :phone
  end

  def sign_up_sanitizer
    @sign_up_sanitizer ||= devise_parameter_sanitizer.for(:sign_up)
  end

  def account_update_sanitizer
    @account_update_sanitizer ||= devise_parameter_sanitizer.for(:account_update)
  end

  def require_login
    unless current_user
      redirect_to user_session_path
    end
  end

  def update_last_activity
    current_user.try(:update_attribute, :last_activity_at, DateTime.now)
  end
end
