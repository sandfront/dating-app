class ConversationsController < ApplicationController

  def create
  end

  def show
    @conversation = Conversation.includes(messages: { user: :user_images }).find(params[:id])
    authorize @conversation
  end

 def index
    # @conversation = Conversation.includes(messages: :user).find(params[:id])
    conversations = policy_scope(Conversation)
    @user = current_user
    if conversations == []

      redirect_to profiles_path, alert: 'You have to match with someone to start a conversation!'
    else
      @started = []
      @unstarted = []
      conversations.delete(nil)
      conversations.each do |convo|
          if convo.messages == []
            @unstarted << convo
          else
            @started << convo
          end
      end
    end
  end
end
