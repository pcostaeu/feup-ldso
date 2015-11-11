class IdeasController < ApplicationController
  def index
  if params[:search]
    @searchideas = Idea.search(params[:search]).order("created_at DESC")
  else
    @searchideas = Idea.all.order('created_at DESC')
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
    @idea.date = Time.zone.now.to_date;
    @idea.save
    redirect_to @idea
  end
private
  def idea_params
      params.require(:idea).permit(:author, :email, :title, :text, :picture)
  end
end
