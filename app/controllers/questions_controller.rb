class QuestionsController < InheritedResources::Base

  before_filter :authenticate_user!

  respond_to :html, :xml, :json

  protected

  def collection
    @questions ||= Question.unsolved
  end
end
