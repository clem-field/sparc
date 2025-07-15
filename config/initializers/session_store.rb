# config/initializers/session_store.rb

Rails.application.config.session_store :cookie_store,
  key: "_sparc_session",
  same_site: :lax
