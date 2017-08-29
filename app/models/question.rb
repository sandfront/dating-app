class Question < ApplicationRecord
  has_many :choices
  has_many :answers, through: :choices
end
