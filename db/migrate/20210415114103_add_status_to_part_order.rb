class AddStatusToPartOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :part_orders, :status, :integer, default: 0
  end
end
