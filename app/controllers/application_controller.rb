class ApplicationController < ActionController::Base
  before_action :authenticate_any!, except: [:top, :about, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_any!
    if admin_signed_in?
      true
    else
      authenticate_customer!
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      root_path
    when Admin
      admin_root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :customer
      root_path
    when :admin
      new_admin_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email])
  end

end
