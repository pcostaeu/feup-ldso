class CreateMonthIdeas < ActiveRecord::Migration
  def change
    create_table :month_ideas do |t|

      t.timestamps null: false
    end
  end
end
