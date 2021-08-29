class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create!(params.require(:card).permit(:content))
    redirect_to cards_path
  end
end
