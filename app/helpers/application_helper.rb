module ApplicationHelper
  def user_pic(user, image_class: '')
    image_tag(user.photo, class: image_class) if user.photo

    image_tag(image_path('default_photo.jpg'), class: image_class)
  end

  def user_cover(user)
    image_tag(user.cover_image, class: 'cover-image') if user.cover_image

    image_tag(image_path('default_cover.jpg'), class: 'cover-image')
  end

  def render_opinion_text(opinion)
    content_tag(:p) do
      separate_mentions(opinion.text).reduce('') do |acc, str|
        next acc + str unless str[0] == '@'

        acc + content_tag(:span, str, class: 'user-link')
      end.html_safe
    end.html_safe
  end

  private

  def separate_mentions(str)
    str.split(/(\@\w+)/)
  end
end
