class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    admin_root_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

end
