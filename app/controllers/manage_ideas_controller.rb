class ManageIdeasController < ApplicationController
  # before_filter - prevents acess without login made
  before_filter :login_required, only: [:index, :approve, :delete]

  # Selects all ideas that didn't win yet
  def index
    @ideas = Idea.where(winner: false).order('created_at DESC')
  end

  # Picks an idea and changes is parameter "winner"
  def approve
    @idea = Idea.find(params[:id])
    @idea.update_attribute(:winner, true)
    @idea.update_attributes(user_params)
    @idea.save

    respond_to do |format|
      format.js { render js: 'hide_approved_idea(' + params[:id] + ');' }
    end
  end

  # Deletes an idea from database
  def delete
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.js { render js: 'hide_deleted_idea(' + params[:id] + ');' }
    end
  end

  private

  # parameters necessary to approve an idea, prevents attemps of submiting other stuff that we dont want
  def user_params
    params.require(:idea).permit(:topic_id)
  end
end
