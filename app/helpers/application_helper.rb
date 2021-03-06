# Application helper
module ApplicationHelper
  def flash_messages
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?

      type = :success if type == :notice
      type = :danger   if type == :alert

      Array(message).each do |msg|
        text = content_tag(
          :div,
          content_tag(
            :button, raw("&times;"), class: 'close', 'data-dismiss' => 'alert'
          ) + msg.html_safe, class: "alert alert-#{type}"
        )
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end


  def tabs(*names)
    elements = names.map do |name|
      current_page?(controller: "/#{name}") && element(name, class: 'active') || element(name)
    end
    raw elements.join
  end

  def dream_statuses
    Dream.statuses.map{|status| [t(status), status]}
  end

  def progress_status(status, step, index)
    type = if step == index && status == 'ongoing'
        :fire
    else
      step < index ? :tasks : :ok
    end
    raw "<span class='glyphicon glyphicon-#{type}'></span>"
  end

  def dream_status(status)
    type = case status.to_sym
    when :ongoing then :warning
    when :completed then :success
    when :failed then :danger
    end
    raw "<span title='#{t(status)}' class='label label-#{type}'>&nbsp;</span>"
  end

  def task_status(status)
    type = if status.nil?
      :refresh
    else
      status ? :ok : :remove
    end
    raw "<span title='#{t(status)}' class='glyphicon glyphicon-#{type}'></span>"
  end

  def extract_ids(collection)
    collection.map(&:id).join(',')
  end

  private

  def element(name, options = {})
    content_tag(:li, options) do
      link_to t(name, scope: :layouts), url_for(controller: "/#{name}")
    end
  end
end
