class AddContactPersonToVendor < ActiveRecord::Migration[6.1]
  def change
    add_column :vendors, :contact_person, :string
    add_column :vendors, :address, :text
  end
end
