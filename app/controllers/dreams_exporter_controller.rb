class DreamsExporterController < ApplicationController
  before_filter :find_dreams

  def create
    pdf = PdfExporter.new(@dreams).perform!
    
    render text: pdf, content_type: 'application/pdf'
  end

  private

    def find_dreams
      query = params[:q]
      query && date = query[:updated_at]
      search = Dream.search(query && query.except(:updated_at))
      @dreams = date && search.result.updated_after(date) || search.result
    end
end
