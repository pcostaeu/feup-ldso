class AddEmail3ToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :email3, :string
  end
end
