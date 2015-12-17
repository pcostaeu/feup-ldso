class IdeasController < ApplicationController
  def index
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
      redirect_to @idea
    end
  end

  def cancel
    @idea = Idea.find(params[:id])
    var = params[:id]
    @idea.destroy
    FileUtils.rm_rf(var)
    redirect_to ideas_path
  end

  private

  def idea_params
      params.require(:idea).permit(:author, :email, :author2, :email2,:author3, :email3, :title, :resumo , :text, :picture)
  end
end
