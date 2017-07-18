class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
    author = params[:author]
    @quotes = Quote.author_search(author)
    json_response(@quotes.page(params[:page]))
  end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote, :created)
  end

  def update
    @quote = Quote.find(params[:id])
    @quote.update(quote_params)
    if @quote.update!(quote_params)
      render status: 200, json: { quote: @quote,
        message: "Your quote has successfully been updated."
      }
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    if @quote.destroy!
      render status: 200, json: {
        message: "Your quote has successfully been deleted."
      }
    end
  end

  private
  def quote_params
    params.permit(:author, :content)
  end
end
