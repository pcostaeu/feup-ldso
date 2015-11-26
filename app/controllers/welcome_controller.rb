class WelcomeController < ApplicationController
  def index
    @has_ideas = Idea.all.size

    if(MonthIdea.all.size != 0)
      @month_idea = Idea.find(MonthIdea.last.idea_id)
    else
      @month_idea = false
    end
    @most_voted_idea = Idea.where(approved: true).select('*,(upvotes - downvotes) as racio').order('racio DESC').first
  end
end
