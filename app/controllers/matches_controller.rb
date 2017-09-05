class MatchesController < ApplicationController

  def create
    @liker = current_user
    @likee = User.find(params[:id])
    if @likee.likes_user(@liker) != []
      preexisting_match = @likee.likes_user(@liker).first
      preexisting_match.mutual = true
      preexisting_match.save
      # redirect_to profiles_path, alert: 'Congratulations it\'s a match!'
      @conversation = Conversation.new(match: preexisting_match)
      authorize @conversation
      @conversation.save
      redirect_to conversation_path(@conversation), alert: 'Congratulations it\'s a match!'
    else
      @match = Match.new(first_user: @liker, second_user: @likee)
      authorize @match
      @match.save
      redirect_to profiles_path, alert: 'You liked that person!'
    end
  end
end
