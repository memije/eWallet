class CreateWalletTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :wallet_transactions do |t|
      t.references :wallet, foreign_key: true
      t.references :transaction_history, foreign_key: true

      t.timestamps
    end
  end
end
