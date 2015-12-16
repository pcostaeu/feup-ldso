class IdeasController < ApplicationController
  def index
    @ideas = Idea.where(winner: true).order('created_at DESC')
  end
  def index_en
    @ideas = Idea.where(winner: true).order('created_at DESC')
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.date = Time.zone.now.to_date
    if @idea.save
      redirect_to :back
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:author, :email, :title, :text, :picture)
  end
end
