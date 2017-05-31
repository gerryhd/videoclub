class CreateRentItems < ActiveRecord::Migration[5.1]
  def change
    create_table :rent_items do |t|
      t.references :movie, foreign_key: true
      t.references :rent_cart, foreign_key: true

      t.timestamps
    end
  end
end
