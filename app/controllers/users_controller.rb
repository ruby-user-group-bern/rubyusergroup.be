class UsersController < InheritedResources::Base

  authorize_resource
  before_filter :authenticate_user!

  respond_to :html, :xml, :json

  actions :index

  has_scope :ordered, :type => :boolean, :default => true
end
