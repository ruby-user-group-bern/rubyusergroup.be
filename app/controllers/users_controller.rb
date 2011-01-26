class UsersController < InheritedResources::Base

  authorize_resource
  before_filter :authenticate_user!

  respond_to :html, :xml, :json

  actions :index

  has_scope :ordered, :type => :boolean, :default => true

  protected

  def collection
    @users ||= end_of_association_chain.paginate(:page => params[:page], :per_page => 10)
  end

end
