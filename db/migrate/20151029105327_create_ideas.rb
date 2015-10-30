class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :text
      t.string :image
      t.integer :upvotes
      t.integer :downvotes
      t.integer :topic_id
      t.boolean :approved
      t.date :date
      t.string :author

      t.timestamps null: false
    end
  end
end
