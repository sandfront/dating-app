class ProfilesController < ApplicationController

  def index
    @profiles = User.all
  end

  def show

  end
end
