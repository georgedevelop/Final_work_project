require "application_system_test_case"

class WorkOrdersTest < ApplicationSystemTestCase
  setup do
    @work_order = work_orders(:one)
  end

  test "visiting the index" do
    visit work_orders_url
    assert_selector "h1", text: "Work Orders"
  end

  test "creating a Work order" do
    visit work_orders_url
    click_on "New Work Order"

    fill_in "Complete date and time", with: @work_order.complete_date_and_time
    fill_in "Description of issue", with: @work_order.description_of_issue
    fill_in "Email", with: @work_order.email
    fill_in "Issue", with: @work_order.issue
    fill_in "Level of issue", with: @work_order.level_of_issue
    fill_in "Line", with: @work_order.line
    fill_in "Location", with: @work_order.location
    fill_in "Machine", with: @work_order.machine
    fill_in "Planned date and time", with: @work_order.planned_date_and_time
    fill_in "Request date time", with: @work_order.request_date_time
    fill_in "Requested by", with: @work_order.requested_by
    fill_in "Type", with: @work_order.type
    click_on "Create Work order"

    assert_text "Work order was successfully created"
    click_on "Back"
  end

  test "updating a Work order" do
    visit work_orders_url
    click_on "Edit", match: :first

    fill_in "Complete date and time", with: @work_order.complete_date_and_time
    fill_in "Description of issue", with: @work_order.description_of_issue
    fill_in "Email", with: @work_order.email
    fill_in "Issue", with: @work_order.issue
    fill_in "Level of issue", with: @work_order.level_of_issue
    fill_in "Line", with: @work_order.line
    fill_in "Location", with: @work_order.location
    fill_in "Machine", with: @work_order.machine
    fill_in "Planned date and time", with: @work_order.planned_date_and_time
    fill_in "Request date time", with: @work_order.request_date_time
    fill_in "Requested by", with: @work_order.requested_by
    fill_in "Type", with: @work_order.type
    click_on "Update Work order"

    assert_text "Work order was successfully updated"
    click_on "Back"
  end

  test "destroying a Work order" do
    visit work_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work order was successfully destroyed"
  end
end
