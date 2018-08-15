class CardsController < ApplicationController

  def index
    @cards = current_customer.cards
  end

  def new
    @card_types = CardType.all
    @card = Card.new
  end

  def create        
    @card_types = CardType.all
    @card = Card.new(card_params)    
    @card.customer = current_customer
    if @card.save
      flash.now[:notice] = "Tarjeta guardada"
      redirect_to cards_path
    else
      flash.now[:error] = @card.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @card_types = CardType.all
    @card = Card.find(params[:id])
    render :new
  end

  def update
    @card = Card.find(params[:id])
  end

  def destroy
    @card = Card.find(params[:id])
    if @card.customer == current_customer && @card.destroy
      flash.now[:notice] = "Tarjeta eliminada"
    else
      flash.now[:error] = @card.errors.full_messages.to_sentence
    end
    redirect_to cards_path
  end

  private
  def card_params
    params.require(:card).permit(:card_name, :expiration_date, :card_type_id)
  end
end
