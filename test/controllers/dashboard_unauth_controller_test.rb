require "test_helper"

class DashboardUnauthControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_unauth_index_url
    assert_response :success
  end
end
