class AnswersController < InheritedResources::Base

  authorize_resource
  before_filter :authenticate_user!
  before_filter :set_question

  respond_to :html, :xml, :json

  belongs_to :question

  def create
    create! do |success, failure|
      success.html { redirect_to question_path(parent) }
      failure.html { render :template => 'questions/show' }
    end
  end

  def update
    update! { @question }
  end

  def destroy
    destroy! { @question }
  end

  protected

  def build_resource
    @answer ||= parent.answers.build params[:answer].merge(:author => current_user)
  end

  def set_question
    @question = parent
  end

end
