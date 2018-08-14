class TransactionHistory < ApplicationRecord
  belongs_to :wallet
  belongs_to :transaction_type

  has_one :card_transaction
  has_one :wallet_transaction

  before_create :calculate_commission


  # Method to calculate final amount (amount + comissions)
  def print_final_amount
    self.amount + self.porcentual_comission + self.fixed_comission
  end

  def print_comissions
    self.porcentual_comission + self.fixed_comission
  end

  private
  # Method to calculate commission rates
  def calculate_commission
    # if transaction amount is less than 1000
    if self.amount <= 1000
      self.porcentual_comission = (self.amount * 0.03)
      self.fixed_comission = 8.00
      # if transaction amount is between 1001 and 5000
    elsif self.amount <= 5000
      self.porcentual_comission = (self.amount * 0.025)
      self.fixed_comission = 6.00
      # if transaction amount is between 5001 and 10000
    elsif self.amount <= 10000
      self.porcentual_comission = (self.amount * 0.02)
      self.fixed_comission = 4.00
      # if transaction amount is 10001 or greater
    elsif self.amount > 10000
      self.porcentual_comission = (self.amount * 0.01)
      self.fixed_comission = 3.00
    end
  end
end
