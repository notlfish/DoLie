module UsersHelper
  def selected_page_highlight(from, link)
    return 'class=navlink-highlight' if from == link
  end

  def first_follower(user)
    return if user.followers.empty?

    follower = user.followers.first
    content_tag(:p, class: 'small-text') do
      content_tag(:span, 'Followed by ') +
        link_to(follower.username, follower, class: 'user-link').html_safe
    end
  end

  def follow_link(current_id, user_id, followeds_ids, css: '')
    return if followeds_ids.include?(user_id)

    link_to(followings_path(follower: current_id, followed: user_id),
            method: 'post', class: 'follow-profile-user') do
      content_tag(:div, fa_icon('plus'), class: css)
    end
  end
end
