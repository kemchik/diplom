class AddTableIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :table_id, :integer
  end
end
