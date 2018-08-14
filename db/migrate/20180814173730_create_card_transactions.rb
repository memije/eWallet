class CreateCardTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :card_transactions do |t|
      t.references :card, foreign_key: true
      t.references :transaction_history, foreign_key: true

      t.timestamps
    end
  end
end
