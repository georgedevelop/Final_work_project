class AddPriceToPartOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :part_orders, :price, :decimal
  end
end
