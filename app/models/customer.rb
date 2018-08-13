class Customer < ApplicationRecord
  belongs_to :wallet

  has_many :card
end
