class ChangeCriteria < ActiveRecord::Migration[5.0]
  def change
      add_column :criterions, :calories, :float
      rename_column :criterions, :fats, :grease
  end
end
