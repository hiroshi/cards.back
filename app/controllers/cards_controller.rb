class CardsController < ApplicationController
  def index
    @cards = Card.where(user: current_user, parent_id: {'$exists' => false}).all
  end

  def new
    @card = Card.new(user: current_user)
  end

  def create
    @card = Card.where(user: current_user).create!(params.require(:card).permit(:content, :parent_id))
    if @card.parent_id
      redirect_to card_path(@card.parent_id)
    else
      redirect_to cards_path
    end
  end

  def show
    @card = Card.where(user: current_user).find(params[:id])
  end

  def destroy
    @card = Card.where(user: current_user).find(params[:id])
    @card.destroy!
    if @card.parent_id
      redirect_to card_path(@card.parent_id)
    else
      redirect_to cards_path
    end
  end
end
