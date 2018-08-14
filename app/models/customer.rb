class Customer < ApplicationRecord

  belongs_to :wallet
  has_many :card

  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true, confirmation: true

end
