class UserCardsController < ApplicationController
  def index
    @cards = current_customer.card
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
