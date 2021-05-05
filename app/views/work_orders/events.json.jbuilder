json.array!(@events) do |event|	
  json.id event.id
  json.start event.planned_date_and_time
  json.end event.complete_date_and_time
  json.title event.description_of_issue
  if event.recurring_frequency == "weekly"
  	day = event.planned_date_and_time.strftime("%a").upcase[0..1]
  	json.rrule "RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=" + day
  end
  if event.recurring_frequency == "biweekly"
  	day = event.planned_date_and_time.strftime("%a").upcase[0..1]
  	json.rrule "RRULE:FREQ=WEEKLY;INTERVAL=2;BYDAY=" + day
  end
  if event.recurring_frequency == "monthly"
  	day = event.planned_date_and_time.strftime("%a").upcase[0..1]
  	json.rrule "RRULE:FREQ=MONTHLY;COUNT=12"
  end

end