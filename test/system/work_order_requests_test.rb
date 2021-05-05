require "application_system_test_case"

class WorkOrderRequestsTest < ApplicationSystemTestCase
  setup do
    @work_order_request = work_order_requests(:one)
  end

  test "visiting the index" do
    visit work_order_requests_url
    assert_selector "h1", text: "Work Order Requests"
  end

  test "creating a Work order request" do
    visit work_order_requests_url
    click_on "New Work Order Request"

    fill_in "Complete date and time", with: @work_order_request.complete_date_and_time
    fill_in "Description of issue", with: @work_order_request.description_of_issue
    fill_in "Email", with: @work_order_request.email
    fill_in "Issue", with: @work_order_request.issue
    fill_in "Level of issue", with: @work_order_request.level_of_issue
    fill_in "Line", with: @work_order_request.line
    fill_in "Location", with: @work_order_request.location
    fill_in "Machine", with: @work_order_request.machine
    fill_in "Planned date and time", with: @work_order_request.planned_date_and_time
    check "Recurring" if @work_order_request.recurring
    fill_in "Request date time", with: @work_order_request.request_date_time
    fill_in "Requested by", with: @work_order_request.requested_by
    fill_in "Work order type", with: @work_order_request.work_order_type
    click_on "Create Work order request"

    assert_text "Work order request was successfully created"
    click_on "Back"
  end

  test "updating a Work order request" do
    visit work_order_requests_url
    click_on "Edit", match: :first

    fill_in "Complete date and time", with: @work_order_request.complete_date_and_time
    fill_in "Description of issue", with: @work_order_request.description_of_issue
    fill_in "Email", with: @work_order_request.email
    fill_in "Issue", with: @work_order_request.issue
    fill_in "Level of issue", with: @work_order_request.level_of_issue
    fill_in "Line", with: @work_order_request.line
    fill_in "Location", with: @work_order_request.location
    fill_in "Machine", with: @work_order_request.machine
    fill_in "Planned date and time", with: @work_order_request.planned_date_and_time
    check "Recurring" if @work_order_request.recurring
    fill_in "Request date time", with: @work_order_request.request_date_time
    fill_in "Requested by", with: @work_order_request.requested_by
    fill_in "Work order type", with: @work_order_request.work_order_type
    click_on "Update Work order request"

    assert_text "Work order request was successfully updated"
    click_on "Back"
  end

  test "destroying a Work order request" do
    visit work_order_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work order request was successfully destroyed"
  end
end
