class DislikesController < ApplicationController

  def create
    disliked_person = User.find(params[:id])
    user_pressed_btn = current_user
    dislike = Dislike.new(first_user: user_pressed_btn, second_user: disliked_person)
    authorize dislike
    if dislike.save

    else
      redirect_to
    end
  end
end
