class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout :layout_by_resource

  protected

  def layout_by_resource
    user_signed_in? ? 'cp' : 'application'


  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end

