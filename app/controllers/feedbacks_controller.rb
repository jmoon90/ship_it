class FeedbacksController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @feedback = @post.feedbacks.build(feedback_params)

    if @feedback.save
      flash[:notice] = "Successfully submitted feedback"
      redirect_to post_path(@post)
    else
      flash[:notice] = "Invalid information. Please try again"
      render template: 'posts/show'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:comment)
  end
end
