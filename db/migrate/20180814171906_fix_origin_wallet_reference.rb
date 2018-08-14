class FixOriginWalletReference < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :wallet_id, :integer
  end
end
