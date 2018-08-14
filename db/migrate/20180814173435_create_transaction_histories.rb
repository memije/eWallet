class CreateTransactionHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_histories do |t|
      t.boolean :complete
      t.decimal :amount
      t.decimal :porcentual_comission
      t.decimal :fixed_comission
      t.references :wallet, foreign_key: true
      t.references :transaction_type, foreign_key: true

      t.timestamps
    end
  end
end
