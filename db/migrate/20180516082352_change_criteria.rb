class ChangeCriteria < ActiveRecord::Migration[5.0]
  def change

      add_column :criteria, :calories, :float
      rename_column :criteria, :fats, :grease

  end
end
