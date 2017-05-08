class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # Devise atualizar e criar conta
  def configure_permitted_parameters
    update_attrs = [:name, :admin, :email, :password, :password_confirmation,
      :schedule, :avatar, :avatar_cache, local_attributes: [:id, :name, :city, :state, :country]]
    devise_parameter_sanitizer.permit :sign_up, keys: update_attrs
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    devise_parameter_sanitizer.permit :sign_up, keys: [:usernamegit]
    devise_parameter_sanitizer.permit :sign_up, keys: [:passwordgit]
  end
end