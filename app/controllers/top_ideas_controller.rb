class TopIdeasController < ApplicationController
  # before_filter - prevents acess without login made
  before_filter :login_required, only: [:index, :remove]

  # Selects from database all winner ideas to show to admin
  def index
    @ideas = Idea.where(winner: true).order('created_at DESC')
  end

  # Removes idea from winners
  def remove
    @idea = Idea.find(params[:id])
    @idea.update_attribute(:winner, false)
    @idea.save

    respond_to do |format|
      format.js { render js: 'hide_remove_top_idea(' + params[:id] + ');' }
    end
  end
end
