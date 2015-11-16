class CreateConcretizeIdeas < ActiveRecord::Migration
  def change
    create_table :concretize_ideas do |t|
      t.integer :ideia_id

      t.timestamps null: false
    end
  end
end
