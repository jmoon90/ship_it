class PostsController < ApplicationController
  def index
    @posts = Post.most_votes
  end

  def show
    @post = Post.find(params[:id])
    @feedback = Feedback.new
  end

  def new
    @post = Post.new(id: params[:id])
  end

  def create
    binding.pry
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Successfully Shipped"
      redirect_to posts_path
    else
      flash[:notice] = "Invalid information. Please try again"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


  private

  def post_params
    params.require(:post).permit(:name, :url, :description, :github_url)
  end
end
