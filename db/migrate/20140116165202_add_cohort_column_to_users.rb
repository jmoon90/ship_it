class AddCohortColumnToUsers < ActiveRecord::Migration
  def up
    add_column :users, :cohort, :string
  end
  def down
    remove_column :users, :cohort, :string
  end
end
