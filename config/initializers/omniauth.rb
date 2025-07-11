Rails.application.config.middleware.use OmniAuth::Builder do
  provider :okta, ENV["OKTA_CLIENT_ID"], ENV["OKTA_CLIENT_SECRET"], {
    client_options: {
      site:                 "https://dev-24606191.okta.com",
      authorization_server: "<authorization_server>",
      authorize_url:        "https://dev-24606191.okta.com/oauth2/<authorization_server>/v1/authorize",
      token_url:            "https://dev-24606191.okta.com/oauth2/<authorization_server>/v1/token",
      user_info_url:        "https://dev-24606191.okta.com/oauth2/<authorization_server>/v1/userinfo",
      audience:             "api://your-audience"
    }
  }
end
