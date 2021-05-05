class AddNameToPart < ActiveRecord::Migration[6.1]
  def change
    add_column :parts, :name, :string
  end
end
