class IdeasController < ApplicationController
  def index
  end
  def show
    @idea = Idea.find(params[:id])
  end

  def new
  end

  def create
  end
end
