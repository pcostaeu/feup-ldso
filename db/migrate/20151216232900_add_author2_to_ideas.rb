class AddAuthor2ToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :author2, :string
  end
end
