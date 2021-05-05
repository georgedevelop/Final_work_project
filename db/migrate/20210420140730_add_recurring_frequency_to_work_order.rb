class AddRecurringFrequencyToWorkOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :work_orders, :recurring_frequency, :string
  end
end
