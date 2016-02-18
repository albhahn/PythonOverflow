get '/questions' do
  # @questions = Question.all
  @questions = ["Meaning of life?", "Favorite flavor icecream?"]
  erb :'questions/all_questions_view'
end
