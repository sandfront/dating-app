class Choice < ApplicationRecord
  has_many :answers
  has_many :users, through: :answers
  belongs_to :question
end
