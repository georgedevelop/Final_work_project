class AddReceivedToPartItem < ActiveRecord::Migration[6.1]
  def change
    add_column :part_items, :received, :integer
  end
end
