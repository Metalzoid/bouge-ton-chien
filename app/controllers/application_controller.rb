class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[photo firstname lastname nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[photo firstname lastname nickname])
  end
end
