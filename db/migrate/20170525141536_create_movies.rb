class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :slug
      t.string :image
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
