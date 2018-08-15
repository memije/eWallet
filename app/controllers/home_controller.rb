class HomeController < ApplicationController

  before_action :authenticate_customer

  def index
    @wallet = current_customer.wallet
    @cards = current_customer.cards
  end
end
