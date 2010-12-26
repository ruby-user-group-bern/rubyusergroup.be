class TopicsController < InheritedResources::Base
    before_filter :authenticate_user!

  respond_to :html, :xml, :json

  def create
    create! do |success, failure|
      success.html { redirect_to root_path }
      failure.html do
        flash[:alert] = resource.errors.full_messages.first
        redirect_to root_path
      end
    end
  end

  protected

  def build_resource
    @topic ||= Topic.new params[:topic].merge(:submitter => current_user)
  end

end
