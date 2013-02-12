module ApplicationHelper
  def link_to_user_page(user)
    link_to user.username, user_path(user)
  end
end
