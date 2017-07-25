

get '/' do
    @post = Post.order(created_at: :desc)
    erb (:index)
end
