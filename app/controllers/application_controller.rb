class ApplicationController < ActionController::Base
  before_action :set_locale



  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:service_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:request_service_owner])
  end

end
