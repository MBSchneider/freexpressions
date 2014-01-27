class AddItemsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :name, :string
    add_column :orders, :address, :string
    add_column :orders, :quantity, :integer
  end
end
