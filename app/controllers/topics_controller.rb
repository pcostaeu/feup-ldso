class TopicsController < ApplicationController
  # Creates new topic to be associated with an idea
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to manage_ideas_path
    else
      render 'new'
    end
  end

  private

  # parameters necessary to create a new topic, prevents attemps of submiting other stuff that we dont want
  def topic_params
    params.require(:topic).permit(:name, :picture)
  end
end
