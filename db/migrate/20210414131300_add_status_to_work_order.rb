class AddStatusToWorkOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :work_orders, :status, :integer, default: 0
  end
end
