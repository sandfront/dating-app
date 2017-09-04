class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.conversations
    end
  end

  def create?
    true
  end

  def show?
    record.match.this_user(user) == user
  end
end
