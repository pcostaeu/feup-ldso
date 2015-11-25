class ConcretizeIdeasController < ApplicationController
    def select       
        if ConcretizeIdea.where(:idea_id => params[:id]).blank?
        @concretize_idea = ConcretizeIdea.new
        @concretize_idea.idea_id = params[:id]
        @concretize_idea.save
       end   
    redirect_to :back
  end
end
