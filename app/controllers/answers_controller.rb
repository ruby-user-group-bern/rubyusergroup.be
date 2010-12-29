class AnswersController < InheritedResources::Base

  authorize_resource
  before_filter :authenticate_user!

  respond_to :html, :xml, :json

  belongs_to :question

  def create
    @question = parent
    create! do |success, failure|
      success.html { redirect_to question_path(parent) }
      failure.html { render :template => 'questions/show' }
    end
  end

  protected

  def build_resource
    @answer ||= parent.answers.build params[:answer].merge(:author => current_user)
  end


end
