class CreateOrderedProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :ordered_products do |t|
      t.integer :productid
      t.integer :orderid
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
