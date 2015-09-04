# DISPLAY INDIVIDUAL PHOTO PAGE
get '/users/:id/albums/:album_id/photos/:photo_id' do
  @user = User.find(session[:user_id])
  @album = Album.find_by(id: params[:album_id], user_id: session[:user_id])
  @photo = Photo.find_by(id: params[:photo_id], album_id: params[:album_id])
erb :photo
end

# UPLOAD NEW PHOTO
post '/upload/:album_id' do

  @photo = Photo.create(image_name: params[:image_name], description: params[:description], image: params[:image], album_id: params[:album_id])

  redirect to("/users/#{session[:user_id]}/albums/#{params[:album_id]}/photos/#{@photo.id}")
end

# EDIT/DELETE EXISTING PHOTO

