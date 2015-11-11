class AddUpvotesToIdeas < ActiveRecord::Migration
  def up
    change_column :ideas, :upvotes, :integer, :default => 0
  end
end
