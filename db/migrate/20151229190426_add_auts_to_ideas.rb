class AddAutsToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :auts, :string
  end
end
