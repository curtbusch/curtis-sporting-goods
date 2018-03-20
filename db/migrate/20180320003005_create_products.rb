class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :image
      t.string :name
      t.string :description
      t.float :price
      t.integer :categoryid
      t.integer :quantity

      t.timestamps
    end
  end
end
