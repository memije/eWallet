class CustomerWallet < ApplicationRecord
  belongs_to :customer
  belongs_to :wallet

  validates_uniqueness_of :wallet_id, scope: :customer_id

  def wallet_name_with_customer
  	"#{wallet.customer.name} - #{wallet.name}"
  end
end
