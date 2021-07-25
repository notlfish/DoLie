module UsersHelper
  def selected_page_highlight(from, link)
    return 'class=navlink-highlight' if from == link
  end

  def first_follower(user)
    return if user.followers.includes(:followers).empty?

    follower = user.followers.first
    content_tag(:p, class: 'small-text') do
      content_tag(:span, 'Followed by ') +
        link_to(follower.username, follower, class: 'user-link').html_safe
    end
  end

  def follow_link(current_id, user_id, followeds_ids, css: '')
    if followeds_ids.include?(user_id)
      return if css == 'follow-follower'

      link_to({ controller: 'followings',
                action: 'destroy',
                followed_id: user_id },
              method: :delete, class: 'follow-profile-user') do
        content_tag(:div, fa_icon('minus'), class: "#{css} unfollow-user-link")
      end
    else
      link_to(followings_path(follower: current_id, followed: user_id),
              method: 'post', class: 'follow-profile-user') do
        content_tag(:div, fa_icon('plus'), class: css)
      end
    end
  end
end
