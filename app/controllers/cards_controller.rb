class CardsController < ApplicationController
  def index
    @cards = Card.where(user: current_user).all
  end

  def new
    @card = Card.new(user: current_user)
  end

  def create
    @card = Card.where(user: current_user).create!(params.require(:card).permit(:content))
    redirect_to cards_path
  end

  def show
    @card = Card.where(user: current_user).find(params[:id])
  end
end
