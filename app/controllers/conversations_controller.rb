class ConversationsController < ApplicationController

  def create
  end

  def show
    @conversation = Conversation.includes(messages: :user).find(params[:id])
  end

 def index
    if current_user.conversations == []
      redirect_to root_path, alert: 'You have to match with someone to start a conversation!'
    else
      @started = []
      @unstarted = []
      current_user.conversations.each do |convo|
          if convo.messages == []
            @unstarted << convo
          else
            @started << convo
          end
      end
    end
  end
end
