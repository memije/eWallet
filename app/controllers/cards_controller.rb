class CardsController < ApplicationController

  def index
    @cards = current_customer.cards
  end

  def show
    @card = Card.find(params[:card_id])
  end

  def new
    @card = Card.new
  end

  def create
  end

  def edit
    @card = Card.find(params[:card_id])
  end

  def update
    @card = Card.find(params[:card_id])
  end

  def delete
    @card = Card.find(params[:card_id])
  end
end
