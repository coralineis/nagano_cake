class ApplicationController < ActionController::Base
  before_action :check_admin_signed_in!, except: [:top, :about, :index]
  before_action :check_customer_signed_in!, except: [:top, :about, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    my_page_path(current_customer)
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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

  private

  def check_customer_signed_in!
    authenticate_customer!
  end

  def check_admin_signed_in!
    if !customer_signed_in?
      authenticate_admin!
    end
  end

end
