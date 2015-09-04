# REGISTER NEW USER
post '/register' do
  name = params[:name]
  email = params[:email]
  password = params[:password]

  user = User.create(name: name, email: email, password: password)

  new_album = Album.create(title: "New Album", description: "desciption..", user_id: user.id)

  session[:user_id] = user.id
  redirect to("/users/#{user.id}")
end

# USER LOG IN
post '/log_in' do
  email = params[:email]
  password = params[:password]
  user = User.find_by email: email, password: password
  if user.nil?
    redirect to '/'
  else
    session[:user_id] = user.id
    redirect to("/users/#{user.id}")
  end
end

# DISPLAY USER PROFILE PAGE
get '/users/:id' do
  if session[:user_id].nil?
    redirect to('/')
  else
    @user = User.find(session[:user_id])
    @albums = @user.albums.all
    erb :user_page
  end
end

# USER LOG OUT
post '/log_out' do
  session[:user_id] = nil
  redirect to('/')
end

# EDIT USER PROFILE
