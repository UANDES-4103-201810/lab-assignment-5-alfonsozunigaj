require 'test_helper'

class UserTicketControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_ticket_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_ticket_destroy_url
    assert_response :success
  end

  test "should get update" do
    get user_ticket_update_url
    assert_response :success
  end

end
