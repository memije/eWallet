class Customer < ApplicationRecord
  has_secure_password
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, :presence, :confirmation
  belongs_to :wallet
  has_many :card
end
