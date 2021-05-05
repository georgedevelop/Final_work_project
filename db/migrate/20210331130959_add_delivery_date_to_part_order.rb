class AddDeliveryDateToPartOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :part_orders, :delivery_date, :datetime
  end
end
