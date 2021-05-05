class AddMhrNumberToPartOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :part_orders, :mhr_number, :string
    add_column :part_orders, :po_number, :string
    add_column :part_orders, :vendor_id, :string
  end
end
