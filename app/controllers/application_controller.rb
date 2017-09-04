class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected
  # Overrides default authenticate user method, setting custom redirect to root
  def authenticate_user!
    redirect_to root_path, notice: "Continue with Facebook to get started" unless user_signed_in?
  end
end
