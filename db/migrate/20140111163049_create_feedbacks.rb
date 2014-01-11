class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
      t.text :comment, null: false
    end
  end
end
