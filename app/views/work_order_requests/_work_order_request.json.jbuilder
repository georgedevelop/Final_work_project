json.extract! work_order_request, :id, :location, :issue, :line, :machine, :work_order_type, :request_date_time, :level_of_issue, :requested_by, :email, :description_of_issue, :planned_date_and_time, :complete_date_and_time, :recurring, :created_at, :updated_at
json.url work_order_request_url(work_order_request, format: :json)
