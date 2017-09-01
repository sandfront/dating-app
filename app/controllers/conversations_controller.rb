class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.includes(messages: :user).find(params[:id])
  end

  def index
    @matches_with_no_chat = current_user.unstarted_chats
    @other_users = @matches_with_no_chat.map do |match|
      [match.first_user, match.second_user].each do |user|
        if user != current_user
          return user
        end
      end
    end
  end
end


[first_user, second_user].each do |user|
  if user != current_user
    return user
  end
end
