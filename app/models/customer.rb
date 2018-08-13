class Customer < ApplicationRecord

  has_secure_password

  belongs_to :wallet

  has_many :card
end
