class QuestionsController < InheritedResources::Base

  before_filter :authenticate_user!

  respond_to :html, :xml, :json

  protected

  def build_resource
    @question ||= current_user.questions.build params[:question]
  end

  def collection
    @questions ||= Question.unsolved
  end
end
