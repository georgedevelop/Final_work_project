json.array!(@vendors) do |vendor|
  json.code vendor.code	
  json.name vendor.name
  json.contact_person vendor.contact_person
  json.phone_number vendor.phone_number
  json.email_address vendor.email_address
  json.address vendor.address
end