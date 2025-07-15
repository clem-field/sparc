# config/initializers/force_devise_mapping.rb

Rails.application.config.to_prepare do
  unless Devise.mappings[:user]
    Devise.add_mapping(:user, {
      class_name: "User",
      modules: User.devise_modules
    })
    Rails.logger.warn "[FIX] Manually registered Devise mapping for :user"
  end
end
