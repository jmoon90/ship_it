class Vote < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :votes

  belongs_to :post,
      inverse_of: :votes

    validates_presence_of :user
    validates_presence_of :post

    validates_uniqueness_of :post_id, scope: :user_id
end
