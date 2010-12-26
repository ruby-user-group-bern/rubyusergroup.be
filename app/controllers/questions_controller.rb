class QuestionsController < InheritedResources::Base

  before_filter :authenticate_user!

  respond_to :html, :xml, :json

  has_scope :tagged_with
  has_scope :unsolved, :type => :boolean, :default => true

  protected

  def build_resource
    @question ||= current_user.questions.build params[:question]
  end

end
