class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address_name
      t.string :postal_code
      t.string :city
      t.integer :userid
      t.integer :provinceid

      t.timestamps
    end
  end
end
