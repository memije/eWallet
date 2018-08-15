class CustomerWalletsController < ApplicationController

  def index
  	@customer_wallets = current_customer.customer_wallets
  end

  def new
  	@customer_wallet = CustomerWallet.new
  end

  def create
  	@wallet = Wallet.find_by(name: params[:customer_wallet][:wallet])
  	if @wallet.blank?
  		flash[:error] = "Wallet no encontrada"
  		redirect_to customer_wallets_path
  		return
  	end
  	@customer_wallet = new
  	@customer_wallet.wallet = @wallet
  	@customer_wallet.customer = current_customer
  	if @customer_wallet.wallet.name != current_customer.wallet.name && @customer_wallet.save
  		flash[:notice] = "Wallet agregada correctamente"
  		redirect_to customer_wallets_path
  	elsif @customer_wallet.wallet.name == current_customer.wallet.name
  		flash.now[:error] = "No puedes agregar tu propia wallet"
  		render :new
  	else
  		flash.now[:error] = @customer_wallet.errors.full_messages.to_sentence
  		render :new
  	end

  end

  def destroy
  	@customer_wallet = CustomerWallet.find(params[:id])
  	if @customer_wallet.customer == current_customer && @customer_wallet.destroy
  		flash[:notice] = "Wallet eliminada correctamente"
  		redirect_to customer_wallets_path
  	elsif @customer_wallet.customer == current_customer
  		flash[:error] = "No cuentas con los permisos suficientes"
		else
  		flash[:error] = @customer_wallet.errors.full_messages.to_sentence
  	end
  end
end
