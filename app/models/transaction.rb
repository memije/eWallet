class Transaction < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :wallet

  has_many :card_transaction
  has_many :wallet_transaction
end
