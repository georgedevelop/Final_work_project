class CreatePartOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :part_orders do |t|
      t.string :part_name
      t.text :part_description

      t.timestamps
    end
  end
end
