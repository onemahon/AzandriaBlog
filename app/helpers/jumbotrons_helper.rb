module JumbotronsHelper
  def jumbotron_text
    if @jumbotron.quote_text_full.present?
      @jumbotron.quote_text_full
    else
      @jumbotron.quote
    end
  end
end
