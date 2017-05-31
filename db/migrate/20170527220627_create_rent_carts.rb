class CreateRentCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :rent_carts do |t|

      t.timestamps
    end
  end
end
