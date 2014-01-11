class Post < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :url
  belongs_to :user
  has_many :feedbacks,
    inverse_of: :post

  has_many :votes,
    dependent: :destroy,
    inverse_of: :post
end
