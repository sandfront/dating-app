class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      (user.gender_preferences.any? ? scope.where(gender: user.gender_preferences) : scope).
        where.not(id: user.id)
    end
  end

  def edit?
    update?
  end

  def update?
    record == user
  end

  def onboard?
    # edit?
    # temp!
    true
  end

  def show?
    !user.nil?
  end

  def destroy?
    update?
  end

  def new_image?
    true
  end
end
