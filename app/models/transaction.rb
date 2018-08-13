class Transaction < ApplicationRecord
  belongs_to :transaction_type

  has_many :card_transaction
  has_many :wallet_transaction
end
