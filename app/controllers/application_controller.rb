class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(user)
    origin_path = session[:origin_path]
    clear_origin_path
    if origin_path.present?
      origin_path
    else
      params[:target].presence || thankyou_path
    end
  end

  private

  def authenticate_user!
    store_origin_path
    super
  end

  def store_origin_path
    session[:origin_path] = thankyou_path
  end

  def clear_origin_path
    session[:origin_path] = nil
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) do |u|
  	  u.permit(:first_name, :last_name, :email, :address_1, :address_2, :phone, :zip_id)
  	end
  	devise_parameter_sanitizer.for(:account_update) do |u|
  	  u.permit(:first_name, :last_name, :email, :address_1, :address_2, :phone, :zip_id)
  	end
  end
end

