module ApplicationHelper
  def user_avatar(user)
    # TODO: avatar upload option
    if user.present?
      #user img
      asset_path('sample_avatar.jpg')
    else
      asset_path('sample_avatar.jpg')
    end
  end
end
