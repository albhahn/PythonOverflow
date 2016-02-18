require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all

#create 10 dummy users
users = 10.times.map do
  User.create!( :user_name => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end


questions_seed = ["Who goes there?", "Where'd you get the coconuts?", "In order to maintain air-speed velocity, a swallow needs to beat its wings forty-three times every second, right?", "Well, how'd you become king, then?", "How do you know she is a witch?", "A newt?", "What... is your name?", "What... is your quest?", "What... is your favourite colour?", "What... is the air-speed velocity of an unladen swallow?"]
questions = []
questions_seed.each do |question|
  description = Faker::Hipster.paragraphs(2)
  this_question = Question.new(  title: question,
                  description: description )
  this_question.user = users[rand(0..9)]
  this_question.save
  questions << this_question
end

answers = 10.times.map do
  text = Faker::Hipster.sentences(1)

  answer = Answer.new( text: text)
  answer.question = questions[rand(0..9)]
  answer.user = users[rand(0..9)]
end

comments1 = 10.times.map do
  text = Faker::Hipster.sentences(1)
  comment = Comment.new(text: text)
  comment.user = users[rand(0..9)]
  comment.commentable = questions[rand(0..9)]
end

comments2 = 10.times.map do
  text = Faker::Hipster.sentences(1)
  comment = Comment.new(text: text)
  comment.user = users[rand(0..9)]
  comment.commentable = answers[rand(0..9)]
end

votes1 = 100.times.map do
  vote = Vote.new()
  vote.user = users[rand(0..9)]
  vote.voteable = answers[rand(0..9)]
end

votes2 = 100.times.map do
  vote = Vote.new()
  vote.user = users[rand(0..9)]
  vote.voteable = answers[rand(0..9)]
end





