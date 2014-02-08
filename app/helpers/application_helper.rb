# Application helper
module ApplicationHelper
  def tabs(*names)
    elements = names.map do |name|
      current_page?(controller: "/#{name}") && element(name, class: 'active') || element(name)
    end
    raw elements.join
  end

  private

  def element(name, options = {})
    content_tag(:li, options) do
      link_to t(name, scope: :layouts), url_for(controller: "/#{name}")
    end
  end
end
