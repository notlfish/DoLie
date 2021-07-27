module UsersHelper
  def selected_page_highlight(from, link)
    return 'class=navlink-highlight' if from == link
  end

  def first_follower(user)
    return if user.followers.empty?

    follower = user.followers.first
    content_tag(:p, class: 'user-entry-text') do
      content_tag(:span, 'Followed by ') +
        link_to(follower.username, follower, class: 'user-link').html_safe
    end
  end
end
