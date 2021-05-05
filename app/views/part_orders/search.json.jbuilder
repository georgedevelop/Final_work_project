json.array!(@parts) do |part|	
  json.name part.mfr_number
  json.description part.description
end