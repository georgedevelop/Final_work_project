json.extract! work_order, :id, :location, :issue, :line, :machine, :type, :request_date_time, :level_of_issue, :requested_by, :email, :description_of_issue, :planned_date_and_time, :complete_date_and_time, :created_at, :updated_at
json.url work_order_url(work_order, format: :json)
