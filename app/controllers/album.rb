# DISPLAY INDIVIDUAL ALBUM PAGE
get '/users/:id/albums/:album_id' do
  if session[:user_id].nil?
    redirect to ('/')
  else
    @user = User.find(session[:user_id])
    @album = Album.find_by(id: params[:album_id], user_id: session[:user_id])
    @all_photos = @album.photos.all
    erb :album
  end
end

# CREATE NEW ALBUM
post '/new_album' do
  title = params[:title]
  description = params[:description]

  @album = Album.create(title: title, description: description, user_id: session[:user_id])
  redirect to("/users/#{session[:user_id]}/albums/#{@album.id}")
end

# EDIT/DELETE EXISTING ALBUM

