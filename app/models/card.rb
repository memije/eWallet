class Card < ApplicationRecord
  belongs_to :card_type
  belongs_to :customer

  has_many :card_transaction

  before_save :encrypt_card_information

  def decrypt_card_number
    crypt = ActiveSupport::MessageEncryptor.new(ENV['KEY'])
    crypt.decrypt_and_verify(self.card_number)
  end

  def decrypt_card_expiration_date
    crypt = ActiveSupport::MessageEncryptor.new(ENV['KEY'])
    crypt.decrypt_and_verify(self.expiration_date)
  end

  private
  def encrypt_card_information
    crypt = ActiveSupport::MessageEncryptor.new(ENV['KEY'])
    self.card_number = crypt.encrypt_and_sign(self.card_number)
    self.expiration_date = crypt.encrypt_and_sign(self.expiration_date)
  end
end
