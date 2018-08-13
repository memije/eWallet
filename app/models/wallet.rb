class Wallet < ApplicationRecord
  has_one :customer
  has_many :wallet_transaction

  before_create :assign_unique_name

  private

  # Method to asign a unique digest as name to wallet
  def assign_unique_name
    self.name = Digest::SHA2.hexdigest(Time.now.to_s)
  end
end
