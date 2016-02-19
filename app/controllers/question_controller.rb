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

  end
end
