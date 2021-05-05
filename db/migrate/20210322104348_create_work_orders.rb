class CreateWorkOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :work_orders do |t|
      t.string :location
      t.string :issue
      t.string :line
      t.string :machine
      t.string :type
      t.datetime :request_date_time
      t.string :level_of_issue
      t.string :requested_by
      t.string :email
      t.string :description_of_issue
      t.datetime :planned_date_and_time
      t.datetime :complete_date_and_time

      t.timestamps
    end
  end
end
