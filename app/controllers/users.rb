get '/users/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/users/#{@user.id}"
  else
    erb :register
  end
end

post '/users/new' do
  @user = User.new(user_name: params[:user_name], email: params[:email])
  @user.password = params[:password_plaintext]
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :register
  end
end
