class AddOriginWalletToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :wallets, index: true, foreign_key: true
  end
end
