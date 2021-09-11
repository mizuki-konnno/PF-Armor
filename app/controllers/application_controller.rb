class ApplicationController < ActionController::Base

    before_action :authenticate_user!,except: [:about]

    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_out_path_for(resource)
    home_about_path
  end

end
