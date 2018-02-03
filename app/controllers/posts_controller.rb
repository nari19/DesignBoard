class PostsController < ApplicationController
  def index
    
     @q = Post.order(created_at: :desc).ransack(params[:q])
     @posts = @q.result(distinct: true)

     @new_posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    @post =Post.new(post_params)
    @post.save
    # redirect_to @post
    redirect_to action:'index'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :color1, :color2, :color3)
  end
  
end
