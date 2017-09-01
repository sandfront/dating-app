class ConversationsController < ApplicationController

<<<<<<< HEAD
  def create

  end

  def show
    @conversation = Conversation.includes(messages: :user).find(params[:id])
  end

  def index
    @other_users_with_no_chat = current_user.unstarted_users #this is user_ids array
    @other_users_with_chat = current_user.started_users #this is user_ids array
    @sorted_convos = current_user.conversations_sorted_by_date # this is convos sorted array
  end
end
