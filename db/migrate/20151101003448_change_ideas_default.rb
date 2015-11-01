class ChangeIdeasDefault < ActiveRecord::Migration
  def up
    change_column :ideas, :downvotes, :integer, :default => 0
  end
end
