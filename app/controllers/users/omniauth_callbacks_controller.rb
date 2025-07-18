# app/controllers/users/omniauth_callbacks_controller.rb
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def okta
    Rails.logger.debug "[OIDC CALLBACK] Hit OIDC method"
    auth = request.env["omniauth.auth"]
    user = User.from_omniauth(auth)

    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: "OIDC") if is_navigational_format?
    else
      session["devise.okta_data"] = auth.except("extra")
      redirect_to new_user_registration_url, alert: "OIDC account could not be linked."
    end
  end

  def failure
    redirect_to root_path, alert: "OIDC authentication failed."
  end
end
