class WalletTransaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :transaction_history, foreign_key: "wallet_transaction_id", class_name: "Transaction"
end
