class ProfilesController < ApplicationController

  def index

  end

  def show

  end

  def edit
    @user = User.find(params[:id])
  end
end
