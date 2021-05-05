class AddPhoneNumberToVendor < ActiveRecord::Migration[6.1]
  def change
    add_column :vendors, :phone_number, :string
  end
end
