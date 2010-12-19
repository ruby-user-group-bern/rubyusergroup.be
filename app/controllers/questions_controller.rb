class QuestionsController < InheritedResources::Base

  before_filter :authenticate_user!

  respond_to :html, :xml, :json

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @questions ||= Question.unsolved
  end
end
