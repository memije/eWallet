class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :transaction_date
      t.boolean :complete
      t.decimal :amount
      t.decimal :porcentual_commission
      t.decimal :fixed_commission
      t.references :transaction_type, foreign_key: true

      t.timestamps
    end
  end
end
