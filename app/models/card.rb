class Card < ApplicationRecord
  belongs_to :card_type
  belongs_to :customer

  has_many :card_transaction
end
