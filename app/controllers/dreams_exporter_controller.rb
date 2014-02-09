class DreamsExporterController < ApplicationController
  def create
    ids = params[:dream_ids].split(',').map(&:to_i)
    dreams = Dream.where(:id => ids)
    pdf = PdfExporter.new(dreams).perform!

    render text: pdf, content_type: 'application/pdf'
  end

  def new
  end
end
