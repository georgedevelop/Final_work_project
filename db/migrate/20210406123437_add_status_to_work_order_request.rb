class AddStatusToWorkOrderRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :work_order_requests, :status, :integer, default: 0
  end
end
