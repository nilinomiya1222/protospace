class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :avatar, :group, :profile, :works)
    devise_parameter_sanitizer.for(:account_update).push(:name, :avatar, :group, :profile, :works)
  end
end
