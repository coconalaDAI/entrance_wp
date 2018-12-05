class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action  :authenticate_user!, except: :after_sign_up
  #before_filterを設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
      when User
        root_path
      when Admin
        admin_pages_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    # if resource_or_scope == :user
    #   new_user_session_path
    # elsif resource_or_scope == :admin
      
    # else
    #   root_path
    # end
    new_session_path(resource_or_scope)
  end

protected

def configure_permitted_parameters
  #strong parametersを設定し、nameを許可
  #devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
end

end
