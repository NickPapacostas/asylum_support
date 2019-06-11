module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = 'nav-item'
    class_name += request.path == link_path ? ' active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def display_datetime(datetime)
    return nil unless datetime

    datetime.strftime("%d/%m/%Y")
  end
end
