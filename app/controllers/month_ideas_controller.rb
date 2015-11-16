class MonthIdeasController < ApplicationController
  def index
    @ideas = Idea.search_by_month(Time.zone.now.to_date.month).order('created_at DESC')
  end

  def new
  end

  def select
    if(MonthIdea.all.size != 0)
      @month_idea = MonthIdea.last
      if (@month_idea.created_at.month != Time.zone.now.to_date.month)
        @month_idea = MonthIdea.new
      end
    else
      @month_idea = MonthIdea.new
    end

    @month_idea.idea_id = params[:id]
    @month_idea.save
    redirect_to :back
  end
end
