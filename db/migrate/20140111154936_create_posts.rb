class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.string :url, null: false
      t.text :description
    end
  end
end
