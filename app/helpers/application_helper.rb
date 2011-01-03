module ApplicationHelper

  include ActsAsTaggableOn::TagsHelper

  def avatar_url(user, options = {})
    opts = {:size => 48}.merge(options)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{opts[:size]}"
  end

  def github_url(github_username)
    "http://github.com/#{github_username}"
  end

  def render_sidebar
    render :partial => "/#{params[:controller]}/sidebar"
  rescue ActionView::MissingTemplate
    ''
  end

end
