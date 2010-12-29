class VotesController < InheritedResources::Base

  authorize_resource
  before_filter :authenticate_user!

  respond_to :html, :xml, :json

  belongs_to :topic

  def create
    create! { :back }
  end

  protected
  def build_resource
    @vote ||= parent.votes.build :voter => current_user
  end


end
