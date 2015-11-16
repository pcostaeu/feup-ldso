class IdeasController < ApplicationController
  def index
    if params[:search] && !params[:search].blank?
      @ideas = Idea.search(params[:search]).order('created_at DESC')
    else
      @ideas = Idea.where(approved: true).order('created_at DESC')
    end
    if params[:crescente]
      @ideas = Idea.select('*,(upvotes - downvotes) as racio').where(approved: true).order('racio ASC')
    end
    if params[:decrescente]
      @ideas = Idea.select('*,(upvotes - downvotes) as racio').where(approved: true).order('racio DESC')
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
  end

  def upvote
    @idea = Idea.find(params[:id])
    @idea.increment!(:upvotes)
    redirect_to :back
  end

  def downvote
    @idea = Idea.find(params[:id])
    @idea.increment!(:downvotes)
    redirect_to :back
    end

  def create
    @idea = Idea.new(idea_params)
    @idea.date = Time.zone.now.to_date
    @idea.approved = false
    @idea.save
    redirect_to @idea
  end

  def cancel
    @idea = Idea.find(params[:id])
    var = params[:id]
    @idea.destroy
    FileUtils.rm_rf(var)
    redirect_to ideas_path
  end

  def self.search_by_month(month)
    where('extract(month from created_at) = ? ', month)
  end

  private

  def idea_params
    params.require(:idea).permit(:author, :email, :title, :text, :picture)
  end
end
