post '/questions/:id/comments' do
  if request.xhr?
    question = Question.find(params[:id])
    user = User.find(session[:user_id])
    comment = Comment.new(text: params[:text])
    comment.user = user
    comment.commentable = question
    comment.save
    return erb :'partials/_list_comments', layout: false, locals: {comment: comment}
  end
end

post '/answers/:id/comments' do
  if request.xhr?
    answer = Answer.find(params[:id])
    user = User.find(session[:user_id])
    comment = Comment.new(text: params[:text])
    comment.user = user
    comment.commentable = answer
    comment.save
    return erb :'partials/_list_comments', layout: false, locals: {comment: comment}
  end
end
