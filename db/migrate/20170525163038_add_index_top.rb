class AddIndexTop < ActiveRecord::Migration[5.1]
  def change
    add_index :movies, :slug, unique: true
  end
end
