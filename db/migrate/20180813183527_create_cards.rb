class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_number
      t.date :expiration_date
      t.references :card_type, foreign_key: true

      t.timestamps
    end
  end
end
