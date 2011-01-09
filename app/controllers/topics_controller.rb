class TopicsController < InheritedResources::Base

  authorize_resource
  before_filter :authenticate_user!

  respond_to :html, :xml, :json

  has_scope :ordered, :type => :boolean, :default => true

  def create
    create! do |success, failure|
      success.html { redirect_to :back }
      failure.html do
        flash[:alert] = resource.errors.full_messages.first
        redirect_to questions_path
      end
    end
  end

  protected

  def build_resource
    @topic ||= Topic.new params[:topic].merge(:submitter => current_user)
  end

  def collection
    @topics ||= end_of_association_chain.paginate(:page => params[:page], :per_page => 10)
  end


end
