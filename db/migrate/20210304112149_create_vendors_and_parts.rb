class CreateVendorsAndParts < ActiveRecord::Migration[6.1]
  def change
    create_table :parts_vendors do |t|
      t.belongs_to :vendor
      t.belongs_to :part
    end
  end
end
