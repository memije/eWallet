class AddTokenFieldToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :security_token, :string
  end
end
