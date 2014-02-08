# Application helper
module ApplicationHelper
  def tabs(*names)
    elements = names.map do |n|
      current_page?(controller: n) && element(n, 'active') || element(n)
    end
    raw elements.join
  end

  private

  def element(name, state = '')
    content_tag(:li, class: state) do
      link_to t(name, scope: :layouts), url_for(controller: name)
    end
  end
end


