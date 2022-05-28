class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resorce)
    user_path(resorce)

  end

  def afetr_sign_put_path_for
    about_path
  end


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

end

