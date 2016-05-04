class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :voteable, polymorphic: true

  belongs_to :user
end
# can access its user, but cannot access whether it belogs to a question or answer
