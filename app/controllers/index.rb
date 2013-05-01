get '/' do
 
  erb :index
end

get '/log_sign' do
  # Look in app/views/index.erb
  erb :log_sign
end

post '/sign_up' do
  @user = User.create(params[:user])
  if @user.valid?
    @user.id = session[:id]
    @last_page = session[:referrer]
    redirect "#{@last_page}"
    session[:referrer] = nil
  else
    @errors = @user.errors.full_messages.join(", ")
    erb :log_sign
  end
end

# post '/log_in' do
#   if @user.valid?
#     @user.id = session[:id]
#     @last_page = session[:referrer]
#     redirect "#{@last_page}"
#   else
#     @errors = @user.errors.full_messages.join(", ")
#     erb :log_sign
#   end
# end


get '/user_profile' do
  erb :user_profile
end
