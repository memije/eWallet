class HomeController < ApplicationController

  before_action :authenticate_customer

  def index
    @wallet = current_customer.wallet
    @customer_wallets = current_customer.customer_wallets
    @cards = current_customer.cards
  end
end
