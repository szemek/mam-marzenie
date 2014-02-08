# Application helper
module ApplicationHelper
  def tabs(*names)
    elements = []

    names.each do |name|
      if current_page?(:controller => name)
        elements << content_tag(:li, class: 'active') do
          link_to t(name), url_for(:controller => name)
        end
      else
        elements << content_tag(:li) do
          link_to t(name), url_for(:controller => name)
        end
      end
    end

    raw elements.join
  end
end
