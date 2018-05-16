class CreateCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :criterions do |t|
      t.string :fats
      t.string :proteins
      t.integer :carbohydrates
      t.timestamps
    end
  end
end
