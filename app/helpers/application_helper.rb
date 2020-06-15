module ApplicationHelper
  def user_avatar(user)
    if !user.nil? && user.avatar?
      user.avatar.url
    else
      asset_path('sample_avatar.jpg')
    end
  end
end
