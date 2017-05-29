class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.date :rented_at
      t.decimal :total_cost

      t.timestamps
    end
  end
end
