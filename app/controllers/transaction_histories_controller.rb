class TransactionHistoriesController < ApplicationController

	before_action :authenticate_customer

	def index
		@wallet = current_customer.wallet
	end

	def new
		@transaction_types = TransactionType.all
		@cards = current_customer.cards
		@debit_cards = current_customer.cards.where(card_type: 1)
		@wallets = current_customer.customer_wallets
		@transaction = TransactionHistory.new
	end

	def create
		@transaction_type = TransactionType.find(params[:transaction_history][:transaction_type_id])
		@wallet = current_customer.wallet
		@amount = params[:transaction_history][:amount]
		@cvv = params[:cvv]

		@transaction =  TransactionHistory.new(amount: @amount, wallet: @wallet, transaction_type: @transaction_type)

		if @transaction.save
			general_wallet.balance += @transaction.get_comissions
			general_wallet.save!
			case @transaction_type.id
			# When is funding the wallet
			when 1
				@wallet.balance += @transaction.get_final_amount
				if @wallet.save
					flash[:notice] = "Fondeo realizado"
					@transaction.complete = true
					redirect_to transaction_histories_path
				else
					flash[:error] = @wallet.errors.full_messages.to_sentence
					redirect_to new_transaction_history_path
				end

			# When is sending money to another wallet
			when 2
				if @wallet.balance >= @transaction.get_final_amount
					@wallet2 = Wallet.find(params[:wallet_id])
					@wallet.balance -= @transaction.get_final_amount
					@wallet2.balance += @amount
					if @wallet.save && @wallet2.save
						flash[:notice] = "Transacción realizada"
						@transaction.complete = true
						redirect_to transaction_histories_path
					else
						flash[:error] = "Error en la operación"
						redirect_to new_transaction_history_path
					end
				else
					flash[:error] = "No cuentas con los fondos necesarios"
					redirect_to new_transaction_history_path
				end

			# When is sending money to debit card
			when 3
				if @wallet.balance >= @transaction.get_final_amount
					@wallet.balance -= @transaction.get_final_amount
					if @wallet.save
						flash[:notice] = "Retiro realizado"
						@transaction.complete = true
						redirect_to transaction_histories_path
					else
						flash[:error] = @wallet.errors.full_messages.to_sentence
						redirect_to new_transaction_history_path
					end
				else
					flash[:error] = "No cuentas con los fondos necesarios"
					redirect_to new_transaction_history_path
				end
			end
			@transaction.save!
		end
	end
end
