require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all

#create 10 dummy users
users = []
10.times.map do
  user = User.create!( :user_name => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
  users << user
end


questions_seed = ["Who goes there?", "Where'd you get the coconuts?", "In order to maintain air-speed velocity, a swallow needs to beat its wings forty-three times every second, right?", "Well, how'd you become king, then?", "How do you know she is a witch?", "A newt?", "What... is your name?", "What... is your quest?", "What... is your favourite colour?", "What... is the air-speed velocity of an unladen swallow?"]

questions = []

questions_seed.each do |question|
  description = Faker::Hipster.paragraph
  this_question = Question.new(  title: question,
                  description: description )
  this_question.user = users[rand(0..9)]
  this_question.save
  questions << this_question
end

answers = []

50.times.map do
  question = questions[rand(0..9)]
  user = users[rand(0..9)]

  text = Faker::Hipster.sentences(1)
  answer = Answer.new( text: text)

  answer.user = user
  question.answers << answer

  question.save
  user.save
  answer.save

  answers << answer
end

comments = []

25.times do
  question = questions[rand(0..9)]
  user = users[rand(0..9)]

  text = Faker::Hipster.sentence(5)
  comment = Comment.new(text: text)

  comment.user = user
  question.comments << comment

  comment.save
  user.save
  question.save

  comments << comment
end

25.times do
  answer = answers[rand(0..9)]
  user = users[rand(0..9)]

  text = Faker::Hipster.sentences(1)
  comment = Comment.new(text: text)
  comment.user = user
  answer.comments << comment

  answer.save
  comment.save
  user.save

  comments << comment
end

votes = []

100.times do
  answer = answers[rand(0..9)]
  user = users[rand(0..9)]

  vote = Vote.new()
  vote.user = user
  answer.votes << vote

  answer.save
  vote.save
  user.save

  votes << vote
end

100.times do
  question = questions[rand(0..9)]
  user = users[rand(0..9)]

  vote = Vote.new()
  vote.user = user
  question.votes << vote

  question.save
  vote.save
  user.save

  votes << vote
end



