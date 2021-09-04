class CardsController < ApplicationController
  def index
    # @cards = Card.where(user: current_user, parent_id: {'$exists' => false}).all
    redirect_to card_path(current_user.root, current_user.root.key)
  end

  # def new
  #   @card = Card.new(user: current_user)
  # end

  def create
    @card = Card.where(user: current_user).create!(params.require(:card).permit(:content, :parent_id))
    redirect_to card_path(@card.parent.id, @card.parent.key)
    # if @card.parent
    #   redirect_to card_path(@card.parent.id, @card.parent.key)
    # else
    #   redirect_to cards_path
    # end
  end

  def show
    @card = Card.where(user: current_user).find(params[:id])
    raise ErrorStatus.new(:not_found) unless params[:key] == @card.key
  end

  def destroy
    @card = Card.where(user: current_user).find(params[:id])
    parent = @card.parent
    @card.unset(:parent_id)
    redirect_to card_path(parent.id, parent.key)
  end
end
