class ConversationsController < ApplicationController

  def create
  end

  def show
    @conversation = Conversation.includes(messages: :user).find(params[:id])
    authorize @conversation
  end

  def index
    conversations = policy_scope(Conversation)
    # conversations = current_user.conversations
    @started = []
    @unstarted = []
    conversations.each do |convo|
      if convo.messages == []
        @unstarted << convo
      else
        @started << convo
      end
    end
  end
end
