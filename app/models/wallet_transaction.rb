class WalletTransaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :transaction_history
end
