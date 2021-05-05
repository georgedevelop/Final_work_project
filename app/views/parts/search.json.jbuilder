json.array!(@parts) do |part|	
  json.mfr_number part.mfr_number
  json.barcode part.barcode
  json.machine part.machine
  json.location part.location
end