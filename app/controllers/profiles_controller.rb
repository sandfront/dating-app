require 'open-uri'
require 'json'

class ProfilesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index

  def index
    query = <<-SQL
      SELECT * FROM users u
      WHERE id NOT IN
      (
        SELECT second_user_id FROM matches WHERE first_user_id = :current_user_id
        UNION
        SELECT first_user_id FROM matches WHERE second_user_id = :current_user_id AND mutual = TRUE
        UNION
        SELECT id FROM users WHERE gender NOT IN (:gender_preferences)
        UNION
        SELECT second_user_id FROM dislikes WHERE first_user_id = :current_user_id
      )
      AND u.id != :current_user_id
    SQL

    @users = User.find_by_sql([ query, { current_user_id: current_user.id, gender_preferences: current_user.gender_preferences }])
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to edit_profile_path(@user) }
        format.js
      end
    else
      puts "you fucked up"
    end
  end

  def onboard
    @user = User.find(params[:user_id])
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:gender, :first_name, :last_name, :course, :college, :what_im_into, :looking_for, {:gender_preferences => []}, user_images: [:id, :user_id, :photo])
  end

end
