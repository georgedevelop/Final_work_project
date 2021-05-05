class CreateParts < ActiveRecord::Migration[6.1]
  def change
    create_table :parts do |t|
      t.text :description
      t.string :location
      t.integer :quantity
      t.string :mfr_number
      t.string :barcode
      t.string :machine

      t.timestamps
    end
  end
end
