class ApproveIdeasController < ApplicationController
  def index
    @ideas = Idea.where(approved: false).order('created_at DESC')
  end

  def approve
    if !params[:topic_id].blank?
      @idea = Idea.find(params[:id])
      @idea.update_attribute(:approved, true)
      @idea.update_attributes(user_params)
      @idea.save
    end
    redirect_to :back
  end

  def delete
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to :back
  end

  private

  def user_params
    params.require(:idea).permit(:topic_id)
  end
end
