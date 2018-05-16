class ChangeNameCriteriaOnCriterions < ActiveRecord::Migration[5.0]
  def change
    rename_table :criteria, :criterions
  end
end
