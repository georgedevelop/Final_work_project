class CreatePartItem < ActiveRecord::Migration[6.1]
  def change
    create_table :part_items do |t|
      t.string :name
      t.string :description
      t.integer :quantity
      t.decimal :rate

      t.timestamps
    end
  end
end
