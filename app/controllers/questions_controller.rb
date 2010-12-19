class QuestionsController < InheritedResources::Base
  respond_to :html, :xml, :json

  protected

  def collection
    @questions ||= Question.unsolved
  end
end
