class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]


  def create
    @community = Community.new(community_params)
    authorize @community
    if @community.save
      redirect_to root_path, alert: "Your community has been submitted for approval!"
    else
      redirect_to landing_path, alert: "Something went wrong"
    end
  end

  private

  def community_params
    params.require(:community).permit(:title, :brand_color, :logo)
  end
end
