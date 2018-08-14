class TransactionType < ApplicationRecord
  has_many :transaction_history
end
