get '/questions' do
  @questions = Question.all
  # @questions = ["Meaning of life?", "Favorite flavor icecream?"]
  erb :'questions/all_questions_view'
end

post '/questions' do
  if request.xhr?
    question = Question.create(title: params[:title], description: params[:description], user: session[:user_id])
    return question.to_json
  else

  end
end
