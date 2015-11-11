class ApproveIdeasController < ApplicationController
  def index
    @ideas = Idea.where(approved: false).order('created_at DESC')
  end

  def approve
    @idea = Idea.find(params[:id])
    @idea.update_attribute(:approved, true)
    @idea.save
    redirect_to :back
  end

  def delete
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to :back
  end
end
