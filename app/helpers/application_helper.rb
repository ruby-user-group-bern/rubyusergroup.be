module ApplicationHelper

  def avatar_url(user, options = {})
    opts = {:size => 100}.merge(options)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{opts[:size]}"
  end

end
