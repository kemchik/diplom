class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, nil: false
      t.string :image
      t.string :ingredients
      t.float :weight
      t.float :calories
      t.float :grease
      t.float :carbohydrates
      t.float :proteins
      t.float :price, nil: false
      t.integer :category_id
      t.timestamps
    end
  end
end
