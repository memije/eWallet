class CardTransaction < ApplicationRecord
  belongs_to :card
  belongs_to :transaction_history, foreign_key: "card_transaction_id", class_name: "Transaction"
end
