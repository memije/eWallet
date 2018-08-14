class TransactionType < ApplicationRecord
  has_many :transaction_histories
end
