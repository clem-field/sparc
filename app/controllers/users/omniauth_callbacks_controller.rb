class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def okta
    auth = request.env['omniauth.auth']
    if auth.nil?
      redirect_to new_user_session_path, alert: "Missing authentication data from Okta"
      return
    end

    @user = User.from_omniauth(auth)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Okta') if is_navigational_format?
    else
      session['devise.okta_data'] = auth.except(:extra)
      redirect_to new_user_registration_url, alert: "Could not create user from Okta"
    end
  end

  def failure
    redirect_to root_path, alert: "Authentication failed."
  end

  # Specific to oidc
  def oidc
    auth = request.env['omniauth.auth']
    user = User.from_omniauth(auth)

    if user.persisted?
      sign_in_and_redirect user, event: :authentication
    else
      session['devise.oidc_data'] = auth.except('extra')
      redirect_to new_user_registration_url, alert: 'Authentication failed.'
    end
  end

  def failure
    redirect_to root_path, alert: 'Authentication error'
  end
end