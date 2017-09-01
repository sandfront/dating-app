class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.includes(messages: :user).find(params[:id])
  end

  def index
    @other_user_with_no_chat = current_user.unstarted_users
    @other_user_with_chat = current_user.started_users

  end
end
