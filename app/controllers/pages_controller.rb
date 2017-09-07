class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]

  def home
    if user_signed_in?
      redirect_to profiles_path
    end
  end

  def landing
    @community = Community.new
  end
end
