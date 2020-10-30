module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    email_address = user.email
    size = options[:size]
    hash = Digest::MD5.hexdigest(email_address)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: 'shadow rounded-circle')
  end

  def body_class
    if current_page?(login_path) || current_page?(signup_path) || current_page?(users_path)
      'register'
    else
      'main'
    end
  end
end
