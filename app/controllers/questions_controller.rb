class QuestionsController < InheritedResources::Base

  authorize_resource
  before_filter :authenticate_user!

  respond_to :html, :xml, :json

  has_scope :tagged_with
  has_scope :unsolved, :type => :boolean, :default => true, :only => [:index]

  protected

  def build_resource
    @question ||= current_user.questions.build params[:question]
  end

  def collection
    @questions ||= end_of_association_chain.paginate(:page => params[:page], :per_page => 5)
  end
end
