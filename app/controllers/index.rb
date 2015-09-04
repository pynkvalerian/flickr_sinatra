get '/' do
  @photos = Photo.all
  erb :index
end
