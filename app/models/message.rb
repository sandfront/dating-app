class Message < ApplicationRecord
  validates :content, presence: true, allow_blank: false
  belongs_to :conversation
  belongs_to :user
  after_create :broadcast_message, :broadcast_message_for_index

  def from?(some_user)
    user == some_user
  end

  def broadcast_message
    ActionCable.server.broadcast("conversation_#{conversation.id}", {
      message_partial: ApplicationController.renderer.render(partial: "shared/message", locals: { message: self, user_is_messages_author: false }),
      current_user_id: user.id
    })
  end

  def broadcast_message_for_index
    ActionCable.server.broadcast("user_#{user.id}", {
      message_partial: ApplicationController.renderer.render(partial: "shared/message", locals: { message: self, user_is_messages_author: false }),
      current_user_id: user.id
    })
  end
end
