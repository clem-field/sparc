class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  # include Authentication
  before_action do
    Rails.logger.debug "[DEBUG] user_signed_in?: #{user_signed_in?}"
    Rails.logger.debug "[DEBUG] current_user: #{current_user&.email.inspect}"
  end
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_turbo_frame_request_variant
  skip_before_action :authenticate_user!, only: [ :index ]
  helper_method :current_user
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # def current_user
  #   session[:user_info]
  # end

  # def authenticate_user!
  #   redirect_to "/" unless current_user
  # end

  private

  def set_turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
