class ConversationsController < ApplicationController

  def index

  end

  def show
    @conversation = Conversation.includes(messages: :user).find(params[:id])
  end
end
