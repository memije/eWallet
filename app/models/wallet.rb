class Wallet < ApplicationRecord
  has_one :customer
  has_many :wallet_transaction
  has_many :transaction_history, foreign_key: "wallet_id", class_name: "Transaction"

  before_create :assign_unique_name

  validates :balance, presence: true

  private

  # Method to asign a unique digest as name to wallet
  def assign_unique_name
    self.name = Digest::SHA2.hexdigest(Time.now.to_s)
  end
end
