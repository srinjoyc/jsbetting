# Homepage (Root path)

enable :sessions

get '/' do
  erb :index
end

get '/tracks' do
  @tracks = Track.all 
  erb :'tracks/index'
end

get '/tracks/new' do
  erb :'tracks/new'
end

post '/tracks' do
  @track = Track.new(
    title:   params[:title],
    author: params[:content],
    URL:  params[:author]
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

get '/signup' do
  erb :signup
end 

post '/signup' do
  @user = User.new(
    username:   params[:user_id],
    password: params[:password]
  )
  if @user.save
    session[:user_id]
    redirect '/tracks'
  else
    erb :'tracks/signup'
  end
end

get '/tracks/login' do
  erb :'tracks/login'
end 

post '/tracks/login' do
  user = User.where(
    username: params[:username],
    password: params[:password])[0]
  session[:user_id] = user.id 
  redirect :'/tracks'
end 

get '/logout' do
  session.clear 
  redirect '/'
end 

post '/tracks/:id/rating' do
  track = Track.find params[:id]
  user = User.find session[:user_id]
  value = params[:rating]
  rating = Rating.new(value: value, track_id: track.id, user_id: user.id)
  if rating.save!
    redirect '/tracks'
    else   
   erb :'index'
  end 
end

# get '/messages/:id' do
#   @message = Message.find params[:id]
#   erb :'messages/show'
# end


