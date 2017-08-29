class Answer < ApplicationRecord
  belongs_to :choice
  belongs_to :user
  has_one :question, through: :choice

  # def question
  #   choice.question
  # end
end
