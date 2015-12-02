class IdeasController < ApplicationController
  def index
      @topics = Topic.all
    if params[:search] && !params[:search].blank?
      @ideas = Idea.search(params[:search]).order('created_at DESC').not_concretize()
    else
      @ideas = Idea.where(approved: true).order('created_at DESC').not_concretize()        
    end
    if params[:order] == "crescente"
      @ideas = Idea.select('*,(upvotes - downvotes) as racio').where(approved: true).order('racio ASC').not_concretize()
    end
    if params[:order] == "decrescente"
      @ideas = Idea.select('*,(upvotes - downvotes) as racio').where(approved: true).order('racio DESC').not_concretize()
    end
    if params[:order] == "newer"
      @ideas = Idea.where(approved: true).order('created_at DESC').not_concretize()
    end
    if params[:order] == "older"
      @ideas = Idea.where(approved: true).order('created_at ASC').not_concretize()
    end
    if params[:order] == "by_topic"
      @ideas = Idea.where(topic_id: params[:id_topic]).order('created_at DESC').not_concretize()
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def upvote
    @idea = Idea.find(params[:id])
    @idea.increment!(:upvotes)
    cookies[params[:id]] = { :value => "voted", :expires => 7.day.from_now }
    respond_to do |format|
    format.js { render :js => "hide_when_upvote("+params[:id]+");" } #this is the second time format.js has been called in this controller!
  end
  end

  def downvote
    @idea = Idea.find(params[:id])
    @idea.increment!(:downvotes)
    cookies[params[:id]] = { :value => "voted", :expires => 7.day.from_now }
    respond_to do |format|
    format.js { render :js => "hide_when_downvote("+params[:id]+");" } #this is the second time format.js has been called in this controller!
  end
    end

  def create
    @idea = Idea.new(idea_params)
    @idea.date = Time.zone.now.to_date
    @idea.approved = false
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

  def self.search_by_month(month)
    where('extract(month from created_at) = ? ', month)
  end

  private

  def idea_params
    params.require(:idea).permit(:author, :email, :title, :text, :picture)
  end
end
