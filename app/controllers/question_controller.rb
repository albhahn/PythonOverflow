get '/questions' do
  # @questions = Question.all
  @questions = Question.all
  erb :'questions/all_questions_view'
end

get "/questions/:id" do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions' do
  if request.xhr?
    question = Question.new(title: params[:title], description: params[:description])
    user = User.find(session[:user_id])
    question.user = user
    question.save
    return question.to_json
  else
    redirect '/questions'
  end
end

post '/questions/:id/votes' do
  question = Question.find(params[:id])
  user = User.find(session[:user_id])
  vote = Vote.new
  vote.question = question
  vote.user = user
  vote.save
  return "true"
end
