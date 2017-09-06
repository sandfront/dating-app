class Conversation < ApplicationRecord
  belongs_to :match
  has_many :messages, dependent: :destroy

  def name
    id
  end
end
