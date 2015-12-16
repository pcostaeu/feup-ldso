class TopIdeasController < ApplicationController
  def index
    @ideas = Idea.where(winner: true).order('created_at DESC')
  end



  def remove
    @idea = Idea.find(params[:id])
    @idea.update_attribute(:winner, false)
    @idea.save

    respond_to do |format|
      format.js { render js: 'hide_remove_top_idea(' + params[:id] + ');' }
    end
  end

  private

  def user_params
    params.require(:idea).permit(:topic_id)
  end
end
