class CreateCommodities < ActiveRecord::Migration[6.1]
  def change
    create_table :commodities do |t|
      t.string :name
      t.string :unit
      t.decimal :price
      t.integer :exchange_id

      t.timestamps
    end
  end
end
