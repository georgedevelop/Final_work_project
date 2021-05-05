class FixType < ActiveRecord::Migration[6.1]
  def change
  	rename_column :work_orders, :type, :work_order_type
  end
end
