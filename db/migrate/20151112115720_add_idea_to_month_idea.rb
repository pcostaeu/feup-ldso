class AddIdeaToMonthIdea < ActiveRecord::Migration
  def change
      add_reference :month_ideas, :idea, index: true
  end
end
