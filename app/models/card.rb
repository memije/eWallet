class Card < ApplicationRecord
  belongs_to :card_type

  has_many :card_transaction
end
