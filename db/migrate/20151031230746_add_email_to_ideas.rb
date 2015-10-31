class AddEmailToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :email, :string
  end
end
