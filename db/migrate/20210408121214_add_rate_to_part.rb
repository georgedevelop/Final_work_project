class AddRateToPart < ActiveRecord::Migration[6.1]
  def change
    add_column :parts, :rate, :decimal
  end
end
