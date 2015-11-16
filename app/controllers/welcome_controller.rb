class WelcomeController < ApplicationController
  def index
    if(MonthIdea.all.size != 0)
      @month_idea = Idea.find(MonthIdea.last.idea_id)
    else
      @month_idea = false
    end
    @most_voted_idea = Idea.select('*,(upvotes - downvotes) as racio').where(approved: true).order('racio DESC').first
  end
end
