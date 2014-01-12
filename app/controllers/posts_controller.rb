class PostsController < ApplicationController
  def index
    @posts = Post.most_votes
  end

  def show
    @post = Post.find(params[:id])
    @feedback = Feedback.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Successfully Shipped"
      redirect_to posts_path
    else
      flash[:notice] = "Invalid information. Please try again"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :url, :description, :github_url)
  end
end
