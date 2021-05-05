class AddQuantityToPartOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :part_orders, :quantity, :float
    add_column :part_orders, :total, :float
    add_column :part_orders, :vendor, :string
    add_column :part_orders, :vendor_contact, :string
    add_column :part_orders, :vendor_address, :text
  end
end
