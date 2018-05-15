class AddUserIdAndOrderIdToHistory < ActiveRecord::Migration[5.0]
  def change
    add_column :histories, :user_id, :integer
    add_column :histories, :order_id, :integer
  end
end
