class PostsController < ApplicationController
  def index 
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "Post Saved!"
      redirect_to @post
    else
      flash.now[:error] = "Could not save post"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy    
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
