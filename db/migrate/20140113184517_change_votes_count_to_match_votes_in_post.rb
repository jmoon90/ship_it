class ChangeVotesCountToMatchVotesInPost < ActiveRecord::Migration
  def change
    posts = Post.all
    posts.each do |p|
      p.update_attribute(:votes_count, p.votes.count)
    end
  end
end
