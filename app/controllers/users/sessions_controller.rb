class Users::SessionsController < Devise::SessionsController
  # before_action :require_authentication, only: [:create]
  # this uses the built in devise functions
  respond_to :html, :turbo_stream

  def new
    # Redirect to Okta if no local login is requested
    if params[:provider] == "okta"
      redirect_to user_okta_omniauth_authorize_path
    else
      super
    end
  end

  # def create
  #   if params[:commit] == "Log in" && params[:user].present?
  #     super  # Local login via Devise
  #   else
  #     redirect_to user_okta_omniauth_authorize_path  # Redirect to Okta login
  #   end
  # end

  def destroy
    super
  end
  # User logging for debugging sessions
  before_action :log_auth_debug

  private

  def log_auth_debug
    Rails.logger.debug "[AUTH DEBUG] session contents: #{session.to_hash.inspect}"
    warden_user = request.env["warden"].user(scope: :user)
    # Rails.logger.debug "[AUTH DEBUG] warden user: #{warden_user.inspect}"
    Rails.logger.debug "[AUTH DEBUG] user_signed_in?: #{user_signed_in?.inspect}"
    # Rails.logger.debug "[AUTH DEBUG] current_user: #{current_user.inspect}"
  end

  protected

  def after_sign_in_path_for(resource)
    # Customize post-login redirect
    stored_location_for(resource) || catalogs_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
