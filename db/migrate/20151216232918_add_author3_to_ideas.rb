class AddAuthor3ToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :author3, :string
  end
end
