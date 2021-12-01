class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :c_type
      t.date :settlement_date
      t.date :tenor
      t.decimal :price
      t.integer :exchange_id

      t.timestamps
    end
  end
end
