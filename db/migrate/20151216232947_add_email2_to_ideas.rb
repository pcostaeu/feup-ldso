class AddEmail2ToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :email2, :string
  end
end
