class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def likes
    Match.where(first_user: self).or(Match.where(second_user: self))
  end

  def matches
    Match.where(first_user: self).or(Match.where(second_user: self)).where(mutual: true)
  end
end
