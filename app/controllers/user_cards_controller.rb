class UserCardsController < ApplicationController
  def index
    @cards = current_customer.cards
  end

  def new
    @card = Card.new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
