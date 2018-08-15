class Wallet < ApplicationRecord
  has_one :customer
  has_many :transaction_histories
  has_many :customer_wallets

  before_create :initialize_wallet

  def to_s
  	self.name
  end

  private

  def initialize_wallet
  	assign_unique_name
  	self.balance = 0
  end

  # Method to asign a unique digest as name to wallet
  def assign_unique_name
    self.name = Digest::SHA2.hexdigest(SecureRandom.uuid)
  end
end
