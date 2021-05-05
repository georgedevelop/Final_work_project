require "test_helper"

class PartOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part_order = part_orders(:one)
  end

  test "should get index" do
    get part_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_part_order_url
    assert_response :success
  end

  test "should create part_order" do
    assert_difference('PartOrder.count') do
      post part_orders_url, params: { part_order: { part_description: @part_order.part_description, part_name: @part_order.part_name } }
    end

    assert_redirected_to part_order_url(PartOrder.last)
  end

  test "should show part_order" do
    get part_order_url(@part_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_order_url(@part_order)
    assert_response :success
  end

  test "should update part_order" do
    patch part_order_url(@part_order), params: { part_order: { part_description: @part_order.part_description, part_name: @part_order.part_name } }
    assert_redirected_to part_order_url(@part_order)
  end

  test "should destroy part_order" do
    assert_difference('PartOrder.count', -1) do
      delete part_order_url(@part_order)
    end

    assert_redirected_to part_orders_url
  end
end
