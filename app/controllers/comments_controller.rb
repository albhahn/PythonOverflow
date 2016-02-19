post '/questions/:id/comments' do
  question = Question.find(params[:id])
  user = User.find(session[:user_id])
  comment = Comment.new(text: params[:text])
  comment.user = user
  comment.commentable = question
  comment.save
  return comment.to_json
end

post '/answers/:id/comments' do
  answer = Answer.find(params[:id])
  user = User.find(session[:user_id])
  comment = Comment.new(text: params[:text])
  comment.user = user
  comment.commentable = answer
  comment.save
  return comment.to_json
end
