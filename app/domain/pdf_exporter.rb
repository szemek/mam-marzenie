class PdfExporter < Struct.new(:dream)
  def perform!
    set_font
    attach_avatar
    set_child_information
    generate
  end

  def set_font
    pdf.font Rails.root.join('app/assets/fonts/DejaVuSans.ttf')
  end

  def attach_avatar
    pdf.image dream.avatar.file.path if dream.avatar
  end

  def set_child_information
    pdf.font_size(20) do
      pdf.draw_text "#{dream.child_fullname}, #{dream.child_age}", :at => [200, height - 85]
    end
    pdf.text_box "#{dream.description}",
      :at => [200, height - 100],
      :width => 500
  end

  def generate
    pdf.render_file filename
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
