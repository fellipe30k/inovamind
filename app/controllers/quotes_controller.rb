class QuotesController < ApplicationController
  before_action :authenticate_request
  before_action :set_quotes, only: [ :show ]

  # GET /quotes
  def index
    @quotes = Quote.all

    render json: @quotes
  end

  # GET /quotes/1
  def show
    render json: @quotes
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotes
      @quotes = Quote.all(tags: [params[:id]])      
    end
end
