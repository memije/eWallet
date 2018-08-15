class TransactionType < ApplicationRecord
  has_many :transaction_histories

  validates :name, presence: true
end
