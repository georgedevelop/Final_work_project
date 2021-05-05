require "application_system_test_case"

class PartOrdersTest < ApplicationSystemTestCase
  setup do
    @part_order = part_orders(:one)
  end

  test "visiting the index" do
    visit part_orders_url
    assert_selector "h1", text: "Part Orders"
  end

  test "creating a Part order" do
    visit part_orders_url
    click_on "New Part Order"

    fill_in "Part description", with: @part_order.part_description
    fill_in "Part name", with: @part_order.part_name
    click_on "Create Part order"

    assert_text "Part order was successfully created"
    click_on "Back"
  end

  test "updating a Part order" do
    visit part_orders_url
    click_on "Edit", match: :first

    fill_in "Part description", with: @part_order.part_description
    fill_in "Part name", with: @part_order.part_name
    click_on "Update Part order"

    assert_text "Part order was successfully updated"
    click_on "Back"
  end

  test "destroying a Part order" do
    visit part_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Part order was successfully destroyed"
  end
end
