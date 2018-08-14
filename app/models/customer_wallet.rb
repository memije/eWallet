class CustomerWallet < ApplicationRecord
  belongs_to :customer
  belongs_to :wallet
end
