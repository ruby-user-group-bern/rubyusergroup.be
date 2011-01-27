class NewslettersController < InheritedResources::Base

  actions :new, :create

  def create
    create! do |success, failure|
      success.html { redirect_to :back }
      failure.html do
        flash[:alert] = resource.errors.full_messages.first
        redirect_to root_path
      end
    end
  end

end
