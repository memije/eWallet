class AddCustomerForeignKeyToCard < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :customers, index: true, foreign_key: true
  end
end
