class ApplicationController < ActionController::Base
  helper_method :current_user_can_edit?

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def current_user_can_edit?(event)
    user_signed_in? && current_user.id == event.user_id
  end
end
