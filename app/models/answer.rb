class Answer < ActiveRecord::Base
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :question
end
# We can access votes, comments, user, and question from this model
