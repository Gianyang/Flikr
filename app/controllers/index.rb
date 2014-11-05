enable :sessions


def login?
  !session[:username].nil?
end

def username
  return session[:username]
end

# get '/users/create' do
#   erb :'/users/create_user'
# end
def current_user
  User.find_by_id(session[:current_user_id])
end




get '/' do
  # Look in app/views/index.erb
  if session[:username]!=nil
    redirect '/user'
  else
    erb :index
  end
end

# get "/upload" do
#   haml :upload
# end

# post "/upload" do
#   File.open('uploads/' + params['myfile'][:filename], "w") do |f|
#     f.write(params['myfile'][:tempfile].read)
#   end
#   return "The file was successfully uploaded!"
# end


