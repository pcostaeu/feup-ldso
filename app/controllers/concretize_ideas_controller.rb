class ConcretizeIdeasController < ApplicationController
    def index       
        @ideas = Idea.joins('INNER JOIN "concretize_ideas" ON "ideas"."id" = "concretize_ideas"."idea_id"')
    end
    def select       
        if ConcretizeIdea.where(:idea_id => params[:id]).blank?
        @concretize_idea = ConcretizeIdea.new
        @concretize_idea.idea_id = params[:id]
        @concretize_idea.save
       end   
    redirect_to :back
  end
end
