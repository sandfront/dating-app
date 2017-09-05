class Match < ApplicationRecord
  belongs_to :first_user, class_name: 'User'
  belongs_to :second_user, class_name: 'User'
  validates :first_user, uniqueness: { scope: :second_user }
  has_one :conversation

  def other_user(test_user)
    [first_user, second_user].each do |user|
      if user != test_user
        return user
      end
    end
  end

  def this_user(test_user)
    [first_user, second_user].each do |user|
      if user == test_user
        return user
      end
    end
  end

  def name
    id
  end

end
