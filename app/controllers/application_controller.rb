class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  # include Authentication
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [ :index ]
  helper_method :current_user
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
    session[:user_info]
  end

  def authenticate_user!
    redirect_to "/" unless current_user
  end
end
