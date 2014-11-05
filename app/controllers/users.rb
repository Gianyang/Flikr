get '/user' do
  @photo= Photo.all 
  erb :user
end

post '/signup' do
  @user = User.create(username: params[:username], password: params[:password])
  redirect '/user?create_user_success'
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
   # byebug
   if @user
     session[:username] = @user[:username]
     session[:password] = @user[:password]
     redirect '/user?login_success'
   else
     redirect '/login'
   end
end

get '/logout' do
  session[:username] = nil
  redirect "/?logout_success"
end