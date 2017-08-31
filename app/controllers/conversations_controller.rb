class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.includes(messages: :user).find(params[:id])
  end
end
