module ApplicationHelper
  def user_pic(user, image_class: '')
    image_tag(user.photo, class: image_class) if user.photo

    image_tag(image_path('default_photo.jpg'), class: image_class)
  end

  def user_cover(user)
    image_tag(user.cover_image, class: 'cover-image') if user.cover_image

    image_tag(image_path('default_cover.jpg'), class: 'cover-image')
  end
end
