class UserImagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def edit?
    show?
  end


  def show?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
