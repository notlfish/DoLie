module UsersHelper
  def selected_page_highlight(from, link)
    return 'class=navlink-highlight' if from == link
  end
end
