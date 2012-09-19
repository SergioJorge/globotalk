module ApplicationHelper
  def avatar_url(talk)
    gravatar_id = Digest::MD5::hexdigest(talk.gravatar_email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
