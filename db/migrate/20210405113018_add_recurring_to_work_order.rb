class AddRecurringToWorkOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :work_orders, :recurring, :boolean
  end
end
