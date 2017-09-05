class DislikesController < ApplicationController

  def create
    disliked_person = User.find(params[:profile_id])
    user_pressed_btn = current_user
    dislike = Dislike.new(first_user: user_pressed_btn, second_user: disliked_person)
    authorize dislike
    if dislike.save
      redirect_to profiles_path
    else
      redirect_to profile_path(disliked_person)
    end
  end
end
