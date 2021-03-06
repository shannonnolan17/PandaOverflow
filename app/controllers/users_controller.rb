get '/users' do
  @user = User.all
  erb :'users/index'
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id'  do
  @user = User.find(params[:id])
  if current_user == @user
    erb :'users/show'
  else
    erb :'users/new'
  end
end
