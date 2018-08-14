class AddCustomerForeignKeyToCard < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :customer, index: true, foreign_key: true
  end
end
