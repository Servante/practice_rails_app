class PostsController < ApplicationController
  def index 
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Post Saved!"
      redirect_to @post
    else
      flash.now[:error] = "Could not save post"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: unprocessable_entity
    end
  end 

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
