class WelcomeController < ApplicationController
  def index
    @has_ideas = Idea.where(winner: true).size
    @counter = 1
    if(@has_ideas != 0)
      @ideas = Idea.where(winner: true).order('created_at DESC').limit(5)
      @first_idea = @ideas.first
      @ideas = @ideas.drop(1)
    end
  end
end
