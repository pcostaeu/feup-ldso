class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :text
      t.integer :topic_id
      t.date :date
      t.string :author
      t.boolean :winner, default: false

      t.timestamps null: false
    end
  end
end
