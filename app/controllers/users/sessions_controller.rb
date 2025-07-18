class Users::SessionsController < Devise::SessionsController
  # before_action :require_authentication, only: [:create]
  # this uses the built in devise functions
  def new
    super
  end

  def create
    if params[:commit] == "Log in" && params[:user].present?
      super  # Local login via Devise
    else
      redirect_to user_okta_omniauth_authorize_path  # Redirect to Okta login
    end
  end

  def destroy
    super
  end

  protected

  def after_sign_in_path_for(resource)
    # Customize post-login redirect
    stored_location_for(resource) || dashboard_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
