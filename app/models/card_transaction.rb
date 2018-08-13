class CardTransaction < ApplicationRecord
  belongs_to :card
  belongs_to :transaction
end
