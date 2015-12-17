class ManageIdeasController < ApplicationController
  before_filter :login_required, :only => [:index, :approve, :delete]
  def index
    @ideas = Idea.where(winner: false).order('created_at DESC')
  end

  def approve
    @idea = Idea.find(params[:id])
    @idea.update_attribute(:winner, true)
    @idea.update_attributes(user_params)
    @idea.save

    respond_to do |format|
      format.js { render js: 'hide_approved_idea(' + params[:id] + ');' }
    end
  end

  def delete
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.js { render js: 'hide_deleted_idea(' + params[:id] + ');' }
    end

  end

  private

  def user_params
    params.require(:idea).permit(:topic_id)
  end
end
