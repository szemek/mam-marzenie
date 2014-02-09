class PdfExporter < Struct.new(:dreams)
  DEFAULT_FONT = Rails.root.join('app/assets/fonts/DejaVuSans.ttf')

  def perform!
    set_font

    dreams.each do |dream|
      attach_avatar(dream)
      set_child_information(dream)

      next_page unless dream == dreams.last
    end

    render_to_stream
  end

  def set_font
    pdf.font DEFAULT_FONT
  end

  def attach_avatar(dream)
    begin
      pdf.image dream.avatar.middle.path
    rescue Exception => e
      Rails.logger.warn(e.message.red)
    end
  end

  def set_child_information(dream)
    pdf.font_size(20) do
      pdf.draw_text "#{dream.child_fullname}, #{dream.child_age}", :at => [200, height - 85]
    end
    pdf.text_box "#{dream.description}",
      :at => [200, height - 100],
      :width => 500
  end

  def next_page
    pdf.start_new_page
  end

  def render_to_stream
    pdf.render
  end

  private

    def pdf
      @pdf ||= Prawn::Document.new(:page_size => [width, height])
    end

    def width
      800
    end

    def height
      500
    end

    def filename
      'dream.pdf'
    end
end
