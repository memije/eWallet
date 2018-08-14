class RenameCardFields < ActiveRecord::Migration[5.2]
  def change

    change_column :cards, :expiration_date, :string

    rename_column :cards, :card_number, :encrypted_card_name
    rename_column :cards, :expiration_date, :encrypted_expiration_date

    add_column :cards, :encrypted_card_name_iv, :string
    add_column :cards, :encrypted_expiration_date_iv, :string
  end
end
