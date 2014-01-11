class Post < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :url
  belongs_to :user
  has_many :feedbacks,
    inverse_of: :post

  has_many :votes,
    dependent: :destroy,
    inverse_of: :post

  def vote_from(user)
    votes.find_by(user_id: user.id)
  end

  def has_vote_from?(user)
    votes.find_by(user_id: user.id).present?
  end

  def self.most_votes
    all.order(votes: :desc)
  end

  class << self
    def by_recency
      order(created_at: :desc)
    end
  end
end
