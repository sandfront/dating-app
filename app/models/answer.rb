class Answer < ApplicationRecord
  belongs_to :choice
  belongs_to :user


  def question
    choice.question
  end
end
