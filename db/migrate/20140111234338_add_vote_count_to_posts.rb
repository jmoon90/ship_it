class AddVoteCountToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :votes_count, :integer, default: 0
    add_index :posts, :votes_count
  end

  def down
    remove_column :posts, :votes_count
  end
end
