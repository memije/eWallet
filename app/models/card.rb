class Card < ApplicationRecord
  attr_encrypted_options.merge!(:encode => true)
  attr_encrypted :card_name, :key => ENV['KEY']
  attr_encrypted :expiration_date, :key => ENV['KEY']

  belongs_to :card_type
  belongs_to :customer

  def masked_card_name
  	"**** **** **** #{self.card_name[-4..-1]}"
  end

end
