class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @wallet = Wallet.create()
    @customer = Customer.new(customer_params)
    @customer.wallet = @wallet
    if @customer.save
      session[:customer_id]
      flash.now[:notice] = "Bienvenido #{@customer.name}"
    else
      flash.now[:error] = @customer.errors.full_messages.to_sentence
      render :new
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation)
  end
end
