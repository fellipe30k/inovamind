class QuotesController < ApplicationController
  #before_action :authenticate_request
  before_action :set_quotes, only: [ :show ]

  # GET /quotes/
  def show
    quotes = @quotes.map do |p|
      {
        quote: p.quote,
        author: p.author,
        author_about: p.author_about,
        tags: p.tags
      }
    end

    render json: { quotes:  quotes  }
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotes
      @quotes = Quote.all(tags: [params[:id]])      
    end
end
