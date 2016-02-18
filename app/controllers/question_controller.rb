get '/questions' do
  # @questions = Question.all
  @questions = Question.all
  erb :'questions/all_questions_view'
end

get "/questions/:id" do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end
