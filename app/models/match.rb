class Match < ApplicationRecord
  belongs_to :first_user, class_name: 'User'
  belongs_to :second_user, class_name: 'User'
  validates :first_user, uniqueness: { scope: :second_user }
end
