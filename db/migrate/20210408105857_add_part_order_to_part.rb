class AddPartOrderToPart < ActiveRecord::Migration[6.1]
  def change
    add_reference :parts, :part_order, null: true, foreign_key: true
  end
end
