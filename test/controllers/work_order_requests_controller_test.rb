require "test_helper"

class WorkOrderRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_order_request = work_order_requests(:one)
  end

  test "should get index" do
    get work_order_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_work_order_request_url
    assert_response :success
  end

  test "should create work_order_request" do
    assert_difference('WorkOrderRequest.count') do
      post work_order_requests_url, params: { work_order_request: { complete_date_and_time: @work_order_request.complete_date_and_time, description_of_issue: @work_order_request.description_of_issue, email: @work_order_request.email, issue: @work_order_request.issue, level_of_issue: @work_order_request.level_of_issue, line: @work_order_request.line, location: @work_order_request.location, machine: @work_order_request.machine, planned_date_and_time: @work_order_request.planned_date_and_time, recurring: @work_order_request.recurring, request_date_time: @work_order_request.request_date_time, requested_by: @work_order_request.requested_by, work_order_type: @work_order_request.work_order_type } }
    end

    assert_redirected_to work_order_request_url(WorkOrderRequest.last)
  end

  test "should show work_order_request" do
    get work_order_request_url(@work_order_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_order_request_url(@work_order_request)
    assert_response :success
  end

  test "should update work_order_request" do
    patch work_order_request_url(@work_order_request), params: { work_order_request: { complete_date_and_time: @work_order_request.complete_date_and_time, description_of_issue: @work_order_request.description_of_issue, email: @work_order_request.email, issue: @work_order_request.issue, level_of_issue: @work_order_request.level_of_issue, line: @work_order_request.line, location: @work_order_request.location, machine: @work_order_request.machine, planned_date_and_time: @work_order_request.planned_date_and_time, recurring: @work_order_request.recurring, request_date_time: @work_order_request.request_date_time, requested_by: @work_order_request.requested_by, work_order_type: @work_order_request.work_order_type } }
    assert_redirected_to work_order_request_url(@work_order_request)
  end

  test "should destroy work_order_request" do
    assert_difference('WorkOrderRequest.count', -1) do
      delete work_order_request_url(@work_order_request)
    end

    assert_redirected_to work_order_requests_url
  end
end
