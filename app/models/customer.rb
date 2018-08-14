class Customer < ApplicationRecord

  belongs_to :wallet
  has_many :cards
  has_many :customer_wallets

  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true
  validates :password, confirmation: true, on: :create

end
