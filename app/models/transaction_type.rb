class TransactionType < ApplicationRecord
  has_many :transaction_history, foreign_key: "transaction_type_id", class_name: "Transaction"
end
