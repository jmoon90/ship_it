class AddGithubUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :github_url, :string
  end
end
