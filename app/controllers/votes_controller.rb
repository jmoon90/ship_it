class VotesController < ApplicationController
before_filter :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    vote = current_user.votes.build
    vote.post = post

    if vote.save
      redirect_to :back, notice: "We heard your vote!"
    else
      redirect_to :back
    end
  end

  def destroy
    current_user.votes.destroy(params[:id])
    redirect_to :back, notice: "All evidence of your voting has been destroyed!"
  end
end
