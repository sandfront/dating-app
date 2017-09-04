class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      users = []
    # does the user have expressed preferences?
      if user.gender_preferences
        if user.gender_preferences.include?("male")
          users << User.where(gender: "male")
        end
        if user.gender_preferences.include?("female")
          users << User.where(gender: "female")
        end
        if user.gender_preferences.include?("non-binary")
          users << User.where(gender: "non_binary")
        end
      else
        # if no expressed preferences, give all
        users = User.all
      end
      return users
    end
  end

  def edit?
    update?
  end

  def update?
    record == user
  end
end
