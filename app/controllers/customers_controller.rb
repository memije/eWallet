class CustomersController < ApplicationController
  def new
    @customer = Customer.new
    render :new, layout: "empty"
  end

  def create
    @wallet = Wallet.create(balance: 0.0)
    @customer = Customer.new(customer_params)
    @customer.wallet = @wallet
    if @customer.save
      session[:customer_id] = @customer.id
      flash.now[:notice] = "Bienvenido #{@customer.name}"
      redirect_to home_path
    else
      flash.now[:error] = @customer.errors.full_messages.to_sentence
      render :new, layout: "empty"
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation)
  end
end
