class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :dish_name
      t.integer :price
      t.references :restaurant, foreign_key: true
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
