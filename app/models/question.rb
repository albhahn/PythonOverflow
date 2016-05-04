class Question < ActiveRecord::Base
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :answers

  belongs_to :user
end
# can access votes, comments, answers, and users
