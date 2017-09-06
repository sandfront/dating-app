class Message < ApplicationRecord
  validates :content, presence: true, allow_blank: false
  belongs_to :conversation
  belongs_to :user
  after_create :broadcast_messages

  def from?(some_user)
    user == some_user
  end
  # if some_user sent the message then returns true

  def broadcast_messages
    ActionCable.server.broadcast("conversation_#{conversation.id}", {
      message_partial: ApplicationController.renderer.render(partial: "shared/message", locals: { message: self, user_is_messages_author: false }),
      current_user_id: user.id
    })

    [conversation.match.first_user, conversation.match.second_user].each do |the_user|
      ActionCable.server.broadcast("user_#{the_user.id}", { "conversations_updated": true })
    end
  end

  # def has_normal_sized_word?
  #   content.split(" ").all? {|word| word < 30 }
  # end

  # def split_content
  #   new_string = ""
  #   old_words = content.split(" ")
  #   old_words.each do |word|
  #     if word > 30
  #       word.split("")

  #     end
  #   end
  # end
end
