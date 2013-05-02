get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end


post '/sign_up' do
  @user = User.create(params[:user])
  if @user.valid?
    @user.id = session[:id]
    erb :profile
  else
    @errors = @user.errors.full_messages.join(", ")
    puts @errors
    erb :signup
  end
end

post '/log_in' do
  @user = User.authenticate(params["user"]["name"], params["user"]["password"])
  if @user
    session[:id] = @user.id
    erb :profile
    # @last_page = session[:referrer]
    # redirect "#{@last_page}"
  else
    @errors = "Wrong username or password."
    erb :login
  end
end

get '/user/:id/posts' do
  @user = User.find(params[:id])
  @posts = @user.posts
  erb :user_posts
end

get '/user/:id/comments' do
  @user = User.find(params[:id])
  @comments = @user.comments
  erb :user_comments
end


# get '/user_profile' do
#   erb :user_profile
# end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :profile  
end

get '/logout' do
  session.clear
  redirect "/"
end

get "/post/new" do
  erb :new_post
end

post "/post/new" do
  if current_user
    post = Post.create(title: params["title"], url: params["url"])
    current_user.posts << post
    redirect "/user/#{current_user.id}"
  else
    @you_fucked_up = true
    erb :index
  end
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end

post "/comment/new/:post_id" do
  @post = Post.find(params[:post_id])
  @comment = Comment.create(body: params["comment_text"])
  @post.comments << @comment
  current_user.comments << @comment
  redirect "/post/#{@post.id}"
end


post "/post/vote" do
  @postvote = PostVote.create(upvote: params["upvote"].to_i, post_id: params["post_id"].to_i)
end

post '/comment/vote' do
  @commentvote = CommentVote.create(upvote: params["upvote"].to_i, comment_id: params["comment_id"])
end




