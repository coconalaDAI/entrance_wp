class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action  :authenticate_user!
  #before_filterを設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    mypages_path
  end

  def after_sign_out_path_for resource
  root_path
  end

protected

def configure_permitted_parameters
  #strong parametersを設定し、nameを許可
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
end

end
