class CreateWorkOrderRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :work_order_requests do |t|
      t.string :location
      t.string :issue
      t.string :line
      t.string :machine
      t.string :work_order_type
      t.datetime :request_date_time
      t.string :level_of_issue
      t.string :requested_by
      t.string :email
      t.string :description_of_issue
      t.datetime :planned_date_and_time
      t.datetime :complete_date_and_time
      t.boolean :recurring

      t.timestamps
    end
  end
end
