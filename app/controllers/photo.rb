get '/photo/new' do
# albums = username.albums
  @albums = current_user.albums
  erb :'/photos/new'
end  

post '/photos' do
  album = Album.find(params[:album_id])
  @photo = album.photos.build
  @photo.source = params[:file_path]
  if @photo.save
    redirect "/user"
  else
    session[:errors] = "failed to save photo"
    redirect "/photos/new"
  end
end


