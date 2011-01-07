class FeedbacksController < InheritedResources::Base

  authorize_resource
  before_filter :authenticate_user!

  respond_to :html, :xml, :json

  actions :all, :except => [:edit, :update]

  def create
    create! { :back }
  end

  protected

  def build_resource
    @feedback ||= current_user.feedbacks.build params[:feedback]
  end

end
