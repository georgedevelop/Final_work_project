class AddEmailAddressToVendor < ActiveRecord::Migration[6.1]
  def change
    add_column :vendors, :email_address, :string
  end
end
