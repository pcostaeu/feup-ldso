class IdeasController < ApplicationController
  # Selects from database all winner ideas to show to user
  def index
    @ideas = Idea.where(winner: true).order('created_at DESC')
  end

  def index_en
    @ideas = Idea.where(winner: true).order('created_at DESC')
  end

  # Creates and saves to database a new idea submited
  def create
    @idea = Idea.new(idea_params)
    @idea.date = Time.zone.now.to_date
    redirect_to :back if @idea.save
  end

  private

  # parameters necessary to submit a new idea, prevents attemps of submiting other stuff that we dont want
  def idea_params
    params.require(:idea).permit(:author, :email, :author2, :email2, :author3, :email3, :title, :resumo, :text, :picture, :auts)
  end
end
