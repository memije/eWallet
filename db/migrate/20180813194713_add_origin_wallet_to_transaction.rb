class AddOriginWalletToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :wallet, index: true, foreign_key: true
  end
end
