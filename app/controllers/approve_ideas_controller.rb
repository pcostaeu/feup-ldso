class ApproveIdeasController < ApplicationController
  def index
    @ideas = Idea.where(approved: false).order('created_at DESC')
  end

  def approve
      @idea = Idea.find(params[:id])
      @idea.update_attribute(:approved, true)
      @idea.update_attributes(user_params)
      @idea.save

    respond_to do |format|
    format.js { render :js => "merda("+params[:id]+");" } #this is the second time format.js has been called in this controller!
  end
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
